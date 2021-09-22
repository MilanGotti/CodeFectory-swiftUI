//
//  LoginScreen.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
//

import SwiftUI

struct LoginScreen: View {
    
    
    var screenSize: CGSize
    @State private var textFieldEmail = ""
    @State private var textFieldPassword = ""
    @State var isShowSignUpScreen = false
    
    var body: some View {
        
            VStack(alignment: .center, spacing: 10){
                Image("login_screen_icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenSize.width / 1.5, height: screenSize.width / 1.5, alignment: .center)
                
                TitleLabel(title: "Log in")
                VStack(spacing: 10, content: {
                    SubHeadingLabel(detail: "Login with social networks")
                    HStack(spacing: 15, content: {
                        IconButton(image: "facebook_icon") {
                            print("Facebook")
                        }
                        IconButton(image: "instagram_icon") {
                            print("Instagram")
                        }
                        IconButton(image: "google_icon") {
                            print("Google")
                        }
                    })
                })
                
                VStack(alignment: .leading, spacing: 10, content: {
                    ThemeTextField("Email", text: $textFieldEmail)
                    SecureTextField("Password", text: $textFieldPassword)
                }).padding(.top)
                
                
                TextButton(title: "Forgot Password?") {
                    //forgot
                }
                
                Spacer(minLength: 10)
                
                VStack(spacing: 10, content: {
                    ThemeButton(title: "Log in") {
                        print("Login")
                    }
                    
                    
                    NavigationLink(
                        destination: SignUpScreen(screenSize: screenSize),
                        isActive: self.$isShowSignUpScreen,
                        label: {
                            TextButton(title: "Sign up") {
                                self.isShowSignUpScreen = true
                            }
                        }).navigationBarBackButtonHidden(true)
                    
                    
                }).padding(.bottom)
                
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(screenSize: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}


