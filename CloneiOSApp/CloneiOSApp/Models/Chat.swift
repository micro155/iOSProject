//
//  Chat.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/09/05.
//

import Foundation
import Firebase

struct Chat: Encodable, Decodable, Hashable {
    
    var messageId: String
    var textMessage: String
    var profile: String
    var photoUrl: String
    var sender: String
    var username: String
    var timestamp: Double
    var isCurrrentUser: Bool {
        return Auth.auth().currentUser!.uid == sender
    }
    var isPhoto: Bool
    
}
