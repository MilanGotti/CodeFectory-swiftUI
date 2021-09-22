//
//  TheamTextField.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
//

import SwiftUI

struct ThemeTextField: View {
    
    @Binding private var text: String
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        TextField(title, text: $text)
            .padding()
            .font(.subheadline)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
            .frame(height: 50)
    }
}



struct SecureTextField: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecured {
                SecureField(title, text: $text)
                    .padding()
                    .font(.subheadline)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
                    .frame(height: 50)
            } else {
                TextField(title, text: $text)
                    .padding()
                    .font(.subheadline)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
                    .frame(height: 50)
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
            .padding(.trailing)
        }
    }
}

