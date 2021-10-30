//
//  ChattingView.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/10/24.
//

import SwiftUI

struct ChattingView: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 5) {
            if (!checked)
            Image("avatar")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            BasicChatView(contentMessage: "this is just test", isCurrentUser: false)
        }
    }
}

struct ChattingView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingView()
    }
}
