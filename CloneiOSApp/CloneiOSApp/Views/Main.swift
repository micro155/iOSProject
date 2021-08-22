//
//  Main.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/08.
//

import SwiftUI
import FirebaseAuth

struct Main: View {
    
    @EnvironmentObject var session: SessionStore
    @StateObject var profileService = ProfileService()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(self.profileService.posts, id: \.postId) { (post) in
                    
                    PostCardImage(post: post)
                    PostCard(post: post)
                    
                }
            }
        }.navigationTitle("")
        .navigationBarHidden(true)
        .onAppear {
            if (Auth.auth().currentUser != nil) {
                self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
            }
        }
        
    }
    
//    var body: some View {
//        Text("Main")
//    }
    
}


