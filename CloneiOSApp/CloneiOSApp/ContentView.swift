//
//  ContentView.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/07.
//

import SwiftUI

struct ContentView: View {
    @State private var mail = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            FormField(value: $mail, icon: "mail", placeholder: "E-mail")
            FormField(value: $password, icon: "lock", placeholder: password, isSecure: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
