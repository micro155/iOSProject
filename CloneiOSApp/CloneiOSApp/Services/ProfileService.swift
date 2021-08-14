//
//  ProfileService.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/14.
//

import Foundation


class ProfileService: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    
    func loadUserPosts(userId: String) {
        PostService.loadUserPosts(userId: userId) {
            (posts) in
            self.posts = posts
        }
    }
    
}
