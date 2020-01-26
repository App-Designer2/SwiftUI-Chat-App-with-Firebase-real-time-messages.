//
//  IDData.swift
//  Chats
//
//  Created by App-Designer2 . on 26.01.20.
//  Copyright © 2020 App-Designer2 . All rights reserved.
//

import SwiftUI


struct iDData : Identifiable {
    var id: String
    var name : String
    var msg : String
    @State var image : Data
}
