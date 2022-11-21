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
        
    }
    
    func register(firstName: String, withEmail email: String, password: String){
        
    }
}
