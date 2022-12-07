//
//  AuthViewModel.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore
import Combine
import CryptoKit
import AuthenticationServices


//Firebase tutorial from video:
// https://www.youtube.com/watch?v=3pIXMwvJLZs , around 2h 24min to approximately 2h 50min, and 4h in
class AuthViewModel: ObservableObject{
    @Published var isError: Bool = false
    @Published var isResetError: Bool = false
    @Published var shouldSend: Bool = false
    @Published var authError: String = ""
    @Published var resetError: String = ""
    @Published var loading = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    @Published var acceptedPrivacyPolicy: Bool = false
    private var userCancellable: Cancellable?
    private let service = UserService()
    fileprivate var currentNonce: String?
    let formatter = PersonNameComponentsFormatter()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }

    // error handling https://stackoverflow.com/questions/69997679/swiftui-firebase-how-to-do-custom-error-handling
    func login(withEmail email: String, password: String){
        self.loading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                let err = error as NSError
                self.isError = true
                print(self.isError)
                switch err.code{
                case AuthErrorCode.invalidEmail.rawValue:
                    if email.isEmpty{
                        self.authError = "You need to enter an email address"
                    }
                    else{
                        self.authError = err.localizedDescription
                    }
                case AuthErrorCode.wrongPassword.rawValue:
                    if password.isEmpty{
                        self.authError = "You need to enter a password"
                    }
                    else{
                        self.authError = "Incorrect password."
                    }
                case AuthErrorCode.networkError.rawValue:
                    self.authError = ("Failed to login. Please check your network connection")
                default:
                    self.authError = ("\(err.localizedDescription)")
                }
                self.loading = false
                return
            }
            
            guard let user = result?.user else{
                return
            }
            self.userSession = user
            self.fetchUser()
            print("DEBUG: Did log user in")
            
        }
        
    }
    
    func register(firstName: String, withEmail email: String, password: String){
        self.loading = true
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard !firstName.isEmpty else {
                self.isError = true
                self.authError = ("You need to enter a first name")
                self.loading = false
                return
            }
            guard self.acceptedPrivacyPolicy else {
                self.isError = true
                self.authError = ("You need to accepept the privacy policy to continue")
                self.loading = false
                return
            }
            if let error = error{
                let err = error as NSError
                self.isError = true
                print(self.isError)
                switch err.code{
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    self.authError = ("Email is already in use.")
                case AuthErrorCode.invalidEmail.rawValue:
                    if email.isEmpty{
                        self.authError = "You need to enter an email address"
                    }
                    else{
                        self.authError = err.localizedDescription
                    }
                case AuthErrorCode.wrongPassword.rawValue:
                    if password.isEmpty{
                        self.authError = "You need to enter a password"
                    }
                    else{
                        self.authError = "Incorrect password."
                    }
                case AuthErrorCode.networkError.rawValue:
                    self.authError = ("Failed to login. Please check your network connection")
                default:
                    self.authError = ("\(err.localizedDescription)")
                }
                self.loading = false
                return
            }
            
            guard let user = result?.user else{
                return
            }
            self.userSession = user
            self.fetchUser()
            
            print("DEBUG: Registered user successfully")
            
            let data = ["firstName": firstName,
                        "email": email,
                        "password": password,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){ _ in
                    print("DEBUG: Did upload user data..")
                }
        }
        
    }
    
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        loading = true
        guard let uid = self.userSession?.uid else{
            self.loading = false
            return
        }
        service.fetchUser(withUid: uid) { userData in
            DispatchQueue.main.async{
                self.currentUser = userData
                self.loading = false
            }
        }
    }
    
    func resetPassword(withEmail email: String){
        Auth.auth().sendPasswordReset(withEmail: email){ error in
            if let error = error{
                self.isResetError = true
                self.resetError = error.localizedDescription
                return
            }
            self.shouldSend = true
            print("DEBUG: Reset password email sent")
        }
    }
}


extension AuthViewModel{
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}


extension AuthViewModel{
    
    
    func signInWithApple(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(nonce)
    }
    
    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>){
        if case .failure(let failure) = result{
            print("DEBUG: Could not login because of error: \(failure.localizedDescription)")
        }
        else if case .success(let success) = result {
            if let appleIDCredential = success.credential as? ASAuthorizationAppleIDCredential{
                guard let nonce = currentNonce else{
                    fatalError("DEBUG: Invalid state: a login callback was received, but no login request was sent.")
                }
                guard let appleIDToken = appleIDCredential.identityToken else{
                    print("DEBUG: Unable to fetch identity token")
                    return
                }
                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                    print("DEBUG: Unable to seralise token string from data: \(appleIDToken.debugDescription)")
                    return
                }
                
                let credential  = OAuthProvider.credential(withProviderID: "apple.com",
                                                           idToken: idTokenString,
                                                           rawNonce: nonce)
                
                
                
                Auth.auth().signIn(with: credential){result, error  in
                    if let error = error{
                        print("DEBUG: Failed to sign in with erorr \(error.localizedDescription)")
                        return
                    }
                    
                    let docRef = Firestore.firestore().collection("users").document(result?.user.uid ?? "default")
                    
                    docRef.getDocument { (document, error) in
                        if let document = document, document.exists {
                            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                            self.userSession = result?.user
                            self.fetchUser()
                        } else {
                            guard let user = result?.user else {
                                return
                            }
                            self.userSession = user
                            self.fetchUser()
                            
                            let data = ["firstName": appleIDCredential.fullName?.givenName ?? "Unknown",
                                        "email": result?.user.email,
                                        "uid": result?.user.uid]
                            
                            Firestore.firestore().collection("users")
                                .document(result?.user.uid ?? "--")
                                .setData(data){ _ in
                                    print("DEBUG: Did upload user data..")
                                }
                            
                            
                        }
                    }
                }
            }
        }
        
    }
}
