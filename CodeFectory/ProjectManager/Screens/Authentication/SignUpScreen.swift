//
//  SignUpScreen.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
//

import SwiftUI

struct SignUpScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var screenSize: CGSize
    @State private var textFieldName = ""
    @State private var textFieldEmail = ""
    @State private var textFieldPassword = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            
            Image("login_screen_icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenSize.width / 1.5, height: screenSize.width / 1.5, alignment: .center)
            
            TitleLabel(title: "Sign up")
            SubHeadingLabel(detail: "Create your account")
            
            VStack(alignment: .leading, spacing: 10, content: {
                ThemeTextField("Name", text: $textFieldName)
                ThemeTextField("Email", text: $textFieldEmail)
                SecureTextField("Password", text: $textFieldPassword)
            }).padding(.top)
            
           
            Spacer()
            
            VStack(spacing: 10, content: {
                ThemeButton(title: "Sign up") {
                    print("Sign up")
                }
                
                TextButton(title: "Log in") {
                    presentationMode.wrappedValue.dismiss()
                }
            }).padding(.bottom)
            
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen(screenSize: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}
