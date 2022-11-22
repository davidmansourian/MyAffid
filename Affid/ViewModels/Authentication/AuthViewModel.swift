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

//Firebase tutorial from video:
// https://www.youtube.com/watch?v=3pIXMwvJLZs , around 2h 24min to approximately 2h 50min, and 4h in
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    private var userCancellable: Cancellable?
    private let service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
        
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to sign in with erorr \(error.localizedDescription)")
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
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to register with erorr \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else{
                return
            }
            self.userSession = user
            self.fetchUser()
            
            print("DEBUG: Registered user successfully")
            print("DEBUG: User is \(self.userSession)")
            
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
        guard let uid = self.userSession?.uid else{
            return
        }
        service.fetchUser(withUid: uid) { userData in
            self.currentUser = userData
        }
    }
}
