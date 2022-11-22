//
//  UserService.swift
//  Affid
//
//  Created by David on 2022-11-22.
//

import FirebaseFirestoreSwift
import FirebaseFirestore
import Firebase


// Service implmeneted with help of video https://www.youtube.com/watch?v=3pIXMwvJLZs 4h in
struct UserService{
    func fetchUser(withUid uid: String, completion: @escaping(UserModel) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else{
                    return
                }
                
                guard let user = try? snapshot.data(as: UserModel.self) else { return }
                completion(user)
                
                print("DEBUG: Name is \(user.firstName)")
                print("DEBUG: Email is: \(user.email)")
            }
    }
}
