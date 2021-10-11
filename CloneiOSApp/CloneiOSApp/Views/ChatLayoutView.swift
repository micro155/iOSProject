//
//  ChatView.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/09/20.
//

import SwiftUI
import SwiftyChat

struct ChatLayoutView: View {
    
    @State var messages : [MockMessages.ChatMessageItem] = MockMessages.generateMessage(kind: .Text, count: 20)
    @State private var message = ""
    @State private var isEditing = false
    
    var body: some View {
        chatView
    }
    
    private var chatView : some View {
        ChatView<MockMessages.ChatMessageItem, MockMessages.ChatUserItem>(messages: $messages) {
            
            BasicInputView(
                message: $message,
                isEditing: $isEditing,
                placeholder: "Type something",
                onCommit:
                    { messageKind in
                        self.messages.append(
                            .init(user: MockMessages.sender, messageKind: messageKind, isSender: true))
            }
            ).padding(8)
            .padding(.bottom, isEditing ? 0 : 8)
            .accentColor(Color(#colorLiteral(red: 0.1405690908, green: 0.1412397623, blue: 0.25395751, alpha: 1)))
            .background(Color.primary.colorInvert())
            .animation(.linear)
            .embedInAnyView()
    }
        .messageCellContextMenu { message -> AnyView in
            switch message.messageKind {
            case .text(let text):
                return Button(action: {
                    print("Copy Context Menu tapped!!")
                    UIPasteboard.general.string = text
                }) {
                    Text("Copy")
                    Image(systemName: "doc.on.doc")
                }.embedInAnyView()
            default:
                // If you don't want to implement contextMenu action
                // for a specific case, simply return EmptyView like below;
                return EmptyView().embedInAnyView()
            }
        }
        // ▼ Required
        .environmentObject(ChatMessageCellStyle.basicStyle)
        .navigationBarTitle("Basic")
        .navigationBarBackButtonHidden(false)
        .listStyle(PlainListStyle())
        
    }
}

struct ChatLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        ChatLayoutView()
    }
}
