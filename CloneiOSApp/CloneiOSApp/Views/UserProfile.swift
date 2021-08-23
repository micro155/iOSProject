//
//  UserProfile.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/24.
//

import SwiftUI

struct UserProfile: View {
    
    @State private var value: String = ""
    @State var users: [User] = []
    @State var isLoading = false
    
    func searchUsers() {
        isLoading = true
        
        SearchService.searchUser(input: value) {
            (users) in
            self.isLoading = false
            self.users = users
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                SearchBar(value: $value).padding()
                    .onChange(of: value, perform: {
                      new in
                        searchUsers()
                    })
                if !isLoading {
                    ForEach(users, id:\.uid) {
                        user in
                        HStack {
                            Text("\(user.email)")
                        }
                        
                    }
                }
            }
        }.navigationTitle("User Search")
    }
}

