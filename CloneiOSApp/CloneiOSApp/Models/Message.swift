//
//  Message.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/09/05.
//

import Foundation


struct Message: Encodable, Decodable, Identifiable {
    var id = UUID()
    var lastMessage: String
    var username: String
    var isPhoto: Bool
    var timestamp: Double
    var userId: String
    var profile: String
    
    
}
