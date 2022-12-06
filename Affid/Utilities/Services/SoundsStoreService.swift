//
//  SoundsStoreService.swift
//  Affid
//
//  Created by David on 2022-12-06.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

class SoundsStoreService: ObservableObject{
    @Published var theSound: [Sound] = []
    
    func loadSounds(){
        print("starting shit")
        Firestore.firestore().collection("sounds").getDocuments { (snapshot, error) in
            guard let snapshot = snapshot else{
                print(error)
                return
            }
            
            for document in snapshot.documents{
                print(document)
                print("now im here")
                let title = document.data()["title"] as? String ?? "error"
                let file = document.data()["file"] as? String ?? "error"
                self.theSound.append(Sound(title: title, file: file))
                print("and now here", self.theSound)
            }
        }
        
    }
}
