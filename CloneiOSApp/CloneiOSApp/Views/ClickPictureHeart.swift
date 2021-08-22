//
//  ClickPictureHeart.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/15.
//

import SwiftUI

struct ClickPictureHeart: View {
    @State private var animate = false
    @State private var likeAnimation = false
    @State private var isLiked = false
    private let duration: Double = 0.4
    private var animationScale: CGFloat {
        isLiked ? 0.6 : 2.0
    }
    
    func performAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
            likeAnimation = false
        }
    }
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
            Image("Lion")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 400, alignment: .center)
                .clipped()
                .onTapGesture(count: 2) {
                    likeAnimation = true
                    performAnimation()
                    self.isLiked.toggle()
                }
                
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .scaleEffect(likeAnimation ? 1 : 0)
                    .opacity(likeAnimation ? 1 : 0)
                    .animation(.spring())
                    .foregroundColor(isLiked ? .red : .black)
            }
            Button(action: {
                self.animate = true
                DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute: {
                    self.animate = false
                    self.isLiked.toggle()
                })
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart").imageScale(.large)
                    .foregroundColor(isLiked ? .red : .black)
            }.padding()
            .scaleEffect(animate ? animationScale: 1)
            .animation(.easeIn(duration: duration))
        }
    }
}

struct ClickPictureHeart_Previews: PreviewProvider {
    static var previews: some View {
        ClickPictureHeart()
    }
}
