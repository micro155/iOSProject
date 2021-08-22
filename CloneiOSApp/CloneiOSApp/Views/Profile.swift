//
//  Profile.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/08.
//

import SwiftUI
import FirebaseAuth
import SDWebImageSwiftUI

struct Profile: View {
    @EnvironmentObject var session: SessionStore
    @State private var selection = 1
    @StateObject var profileService = ProfileService()
    
    let threeColumns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ScrollView {
        VStack {
            ProfileHeader(user: self.session.session)
            Button(action: {}) {
                Text("Edit Profile")
                    .font(.title)
                    .modifier(ButtonModifiers())
                    
            }.padding(.horizontal)
            Picker("", selection: $selection) {
                Image(systemName: "circle.grid.2x2.fill").tag(0)
                Image(systemName: "person.circle").tag(1)
            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            
            if selection == 0 {
                LazyVGrid(columns: threeColumns) {
                    ForEach(self.profileService.posts, id: \.postId) {
                        (post) in
                        WebImage(url: URL(string: post.mediaUrl)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 3).clipped()
                    }
                }
            }
            
        }
        
    }.navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {}){
            Image(systemName: "person.fill")
        }, trailing: Button(action: {
            self.session.logout()
        }){
            Image(systemName: "arrow.right.circle.fill")
        })
        .onAppear {
                self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
            }
    }
    
}


