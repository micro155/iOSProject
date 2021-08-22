//
//  ProfileHeader.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/14.
//

import SwiftUI
import SDWebImageSwiftUI


struct ProfileHeader: View {
    
    var user: User?
    var postsCount: Int
    @Binding var following: Int
    @Binding var followers: Int
    
    var body: some View {
        HStack {
        VStack {
            if user != nil {
                WebImage(url: URL(string: user!.profileImageUrl)!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100, alignment: .trailing)
                    .padding(.leading)
                
                Text(user!.username).font(.headline).bold()
                    .padding(.leading)
            } else {
                Color.init(red: 0.9, green: 0.9, blue: 0.9)
                    .frame(width: 100, height: 100, alignment: .trailing)
                    .padding(.leading)
            }
            
            
        }
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("Posts")
                        .font(.footnote)
                    Text("\(postsCount)")
                        .font(.title).bold()
                }.padding(.top, 60)
                Spacer()
                VStack {
                    Text("Followers")
                        .font(.footnote)
                    Text("\(followers)")
                        .font(.title).bold()
                }.padding(.top, 60)
                Spacer()
                VStack {
                    Text("Following")
                        .font(.footnote)
                    Text("\(following)")
                        .font(.title).bold()
                }.padding(.top, 60)
                Spacer()
            }
        }
        }
    }
}
