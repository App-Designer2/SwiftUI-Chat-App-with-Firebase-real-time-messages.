//
//  DataFire.swift
//  Chats
//
//  Created by App-Designer2 . on 25.01.20.
//  Copyright © 2020 App-Designer2 . All rights reserved.
//

import Firebase
import Combine


class DataFire : ObservableObject {
    @Published var chat = [iDData]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("chat").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges {
                if i.type == .added {
                    
                    guard let name = i.document.get("name") as? String else { return }
                    guard let msg = i.document.get("msg") as? String else { return }
                    guard let image = i.document.get("image") as? Data else { return }
                     let id = i.document.documentID
                    
                    self.chat.append(iDData(id: id,name: name, msg: msg, image: image))
                }
            }
        }
    }
    func addInfo(msg: String, user: String, image: Data) {
        let db = Firestore.firestore()
        
        db.collection("chat").addDocument(data: ["msg": msg, "name": user, "image": image]) { (err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            print("Success")
        }
    }
}
