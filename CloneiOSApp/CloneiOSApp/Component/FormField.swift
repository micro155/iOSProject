//
//  FormField.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/07.
//

import SwiftUI

struct FormField: View {
    @Binding var value: String
    
    var icon: String
    var placeholder: String
    var isSecure = false
    
    
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: icon)
                    .padding()
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    } else {
                        TextField(placeholder, text: $value)
                    }
                }.font(Font.system(size: 20, design: .monospaced))
                .foregroundColor(.black)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
            }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 4))
            .padding()
        }
    }
}
