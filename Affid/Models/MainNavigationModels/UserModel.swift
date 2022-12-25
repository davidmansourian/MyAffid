//
//  UserModel.swift
//  Affid
//
//  Created by David on 2022-11-22.
//

import FirebaseFirestoreSwift

struct UserModel: Identifiable, Decodable{
    @DocumentID var id: String?
    let firstName: String
    let email: String
}
