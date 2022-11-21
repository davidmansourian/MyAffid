//
//  AuthViewModel.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(self.userSession)")
    }
    
    func login(withEmail email: String, password: String){
        print("DEBUG: Login with email \(email)")
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
            
            print("DEBUG: Registered user successfully")
            print("DEBUG: User is \(self.userSession)")
            
        }
        
    }
}
