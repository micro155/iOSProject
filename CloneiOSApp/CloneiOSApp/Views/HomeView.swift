//
//  HomeView.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/08.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationView {
            
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            
        }.accentColor(.red)
    }
}

var tabs = ["house.fill", "magnifyingglass", "camera.viewfinder", "heart.fill", "person.fill"]

struct CustomTabView : View {
    @State var selectedTab = "house.fill"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                TabView(selection: $selectedTab) {
                    Main()
                        .tag("house.fill")
                    Search()
                        .tag("magnifyingglass")
                    Post()
                        .tag("camera.viewfinder")
                    Notifications()
                        .tag("heart.fill")
                    Profile()
                        .tag("person.fill")
                }
                HStack(spacing: 0) {
                    ForEach(tabs, id: \.self) {
                        image in
                        TabButton(image: image, selectedTab: $selectedTab)
                        
                        if image != tabs.last {
                            Spacer(minLength: 0)
                        }
                    }
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 5)
                .background(Color.white)
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
                .padding(.horizontal)
                .padding(.bottom, edge!.bottom == 0 ? 20 : 0)
            }
        }.accentColor(.pink)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
    
    
}

struct TabButton: View {
    var image: String
    
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {selectedTab = image}) {
            Image(systemName: "\(image)")
                .foregroundColor(selectedTab == image ? Color.gray : Color.black)
                .padding()
        }
    }
}
