//
//  ChattingView.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/10/24.
//

import SwiftUI

struct BasicChatView: View {
    
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}

struct BasicChatView_Previews: PreviewProvider {
    static var previews: some View {
        BasicChatView(contentMessage: "Hi test", isCurrentUser: true)
    }
}
