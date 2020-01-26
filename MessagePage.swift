//
//  MessagePage.swift
//  Chats
//
//  Created by App-Designer2 . on 25.01.20.
//  Copyright © 2020 App-Designer2 . All rights reserved.
//

import SwiftUI
import Combine

struct Messagepage: View {
    @ObservedObject var message = DataFire()
    var name = ""
    
    @Binding var image : Data
    
    @State var write = ""
    var body: some View {
        VStack {
            List(message.chat) { i in
                if i.name == self.name {
                    ListMessage(msg: i.msg, Message: true, user: i.name, image: i.$image)
                } else {
                    ListMessage(msg: i.msg, Message: false, user: i.name, image: i.$image)
                }
                
            }.navigationBarTitle("Chats", displayMode: .inline)
            
            HStack {
                TextField("message...",text: self.$write).padding(10)
                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                .cornerRadius(25)
                
                Button(action: {
                    if self.write.count > 0 {
                        self.message.addInfo(msg: self.write, user: self.name, image: self.image)
                        self.write = ""
                    } else {
                        
                    }
                }) {
                    Image(systemName: "paperplane.fill").font(.system(size: 20))
                        .foregroundColor((self.write.count > 0) ? Color.blue : Color.gray)
                        .rotationEffect(.degrees(50))
                    
                }
            }.padding()
        }
    }
}


//If you have a iPhpne with the iOS device up 13 and some of your friends,
//you could install the app in your and their iPhone to keeping chating with them through this app.
// this an amazing feeling.!!!
//🥳
