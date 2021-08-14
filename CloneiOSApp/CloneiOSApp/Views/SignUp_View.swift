//
//  SignUp_View.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/07.
//

import SwiftUI


struct SignUp_View : View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showingImagePicker = false
    @State private var showingActionSheet = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh No 😂"
    
    func loadImage()  {
        guard let inputImage = pickedImage else {
            return
        }
        profileImage = inputImage
    }
    
    func errorCheck() -> String? {
        
        if email.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty || username.trimmingCharacters(in: .whitespaces).isEmpty ||
            imageData.isEmpty {
            
            return "Please fill in all fields and provide an image"
        }
        return nil
    }
    
    func signUp() {
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            self.clear()
            return
        }
        
        AuthService.signUp(username: username, email: email, password: password, imageData: imageData, onSuccess: {
            (user) in
            self.clear()
        }) {
            (errorMessage) in
            
            self.error = errorMessage
            self.showingAlert = true
            return
        }
    }
    
    func clear() {
        self.email = ""
        self.username = ""
        self.password = ""
        self.imageData = Data()
        self.profileImage = Image(systemName: "person.circle.fill")
    }
    
    
    var body: some View {
        ScrollView {
            VStack (spacing: 5) {
                Image(systemName: "camera")
                    .font(.system(size: 60, weight: .black, design: .monospaced))
                
                VStack (alignment: .leading) {
                    Text("Welcome")
                        .font(.system(size: 32, weight: .heavy))
                    Text("Sign Up to Start")
                        .font(.system(size: 16, weight: .medium))
                }
                
                VStack (spacing: 10) {
                    Group {
                        if profileImage != nil {
                            profileImage!.resizable()
                                .clipShape(Circle())
                                .frame(width: 200, height: 200)
                                .padding(.top, 20)
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                        }
                    }
                }
                
                Group {
                    FormField(value: $username, icon: "person.fill", placeholder: "Username")
                    FormField(value: $email, icon: "envelope.fill", placeholder: "E-mail")
                    FormField(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)
                }
                
                Button(action: signUp) {
                    Text("Sign Up")
                        .font(.title)
                        .modifier(ButtonModifiers())
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
                }
            }.padding()
        }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }.actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text(""), buttons: [
                .default(Text("Choose A Photo")){
                    self.sourceType = .photoLibrary
                    self.showingImagePicker = true
            },
                .default(Text("Take A Photo")){
                    self.sourceType = .camera
                    self.showingImagePicker = true
            },
                .cancel()
            ])
        }
    }
}

struct SignUp_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp_View()
    }
}
