//
//  PostCardImage.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/15.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardImage: View {
    
    var post: PostModel
    
//    func printv(_ data: Any) -> EmptyView {
//        print(data)
//        return EmptyView()
//    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                WebImage(url: URL(string: post.profile)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60, alignment: .center)
                    .shadow(color: .gray, radius: 3)
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.username)
                        .font(.headline)
                    Text((Date(timeIntervalSince1970: post.date)).timeAgo() + " ago")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }.padding(.leading, 10)
            }.padding(.leading)
            .padding(.top, 16)
            
            Text(post.caption)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 32)
            
            WebImage(url: URL(string: post.mediaUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.size.width, height: 400, alignment: .center)
                .clipped()
            
        }
        
//        printv(post.mediaUrl)
        
    }
}

//struct PostCardImage_Previews: PreviewProvider {
//    static var previews: some View {
//        PostCardImage()
//    }
//}