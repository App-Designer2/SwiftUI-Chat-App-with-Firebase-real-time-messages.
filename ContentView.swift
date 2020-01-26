//
//  ContentView.swift
//  Chats
//
//  Created by App-Designer2 . on 25.01.20.
//  Copyright © 2020 App-Designer2 . All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var name : String = ""
    @State var show = false
    @State var image : Data = .init(count: 0)
    var body: some View {
        NavigationView {
            ZStack {
                //my Mac Air is really slow today sorry.
                VStack {
                    if self.image.count != 0 {
                        Image(uiImage: UIImage(data: self.image)!).resizable()
                        .frame(width: 55, height: 55)
                    .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    
                    } else {
                        Button(action: {
                            self.show.toggle()
                        }) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 55, height: 55)
                        .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        }
                    }
                    
                    TextField("Username..", text: self.$name).padding(10)
                        .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                    .cornerRadius(20)
                    
                    NavigationLink(destination: Messagepage(name: self.name,image: self.$image)){
                        HStack {
                            Text("Enter").padding(12)
                                .foregroundColor(.white)
                                .background((self.name.count > 0) ? Color.blue : Color.gray)
                            .cornerRadius(8)
                            
                        }
                    }//NvtLink
                }/*VStack*/.background(Color.white)
                .cornerRadius(20)
                    //.shadow(color: .gray, radius: 5, x: 1, y:1)
                .padding()
            }//ZStack
        }//NavigationView
            .sheet(isPresented: self.$show, content: {
                ImagePicker(show: self.$show, image: self.$image)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// i will share the whole code in my github account.
//so i hope you like and dont forget to subscribe and give a like thank you for watching!!!!!
