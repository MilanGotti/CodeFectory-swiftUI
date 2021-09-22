//
//  ThemeButton.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
//

import SwiftUI

struct ThemeButton: View {
    
    var title: String
    var buttonAction: ()->() = {}
    
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            Text(title)
                .fontWeight(.bold)
                .frame(minWidth: 0,  maxWidth: .infinity)
                .padding(14)
                .font(.title3)
                .foregroundColor(.white)
                .background(Color.appOrange)
                .cornerRadius(15)
        })
    }
}


struct IconButton: View {
    
    var image: String
    var ButtonAction: ()->() = {}
    
    var body: some View {
        Button(action: {
            self.ButtonAction()
        }, label: {
            Image(self.image)
                .resizable()
                .frame(width: 40, height: 40)
                .shadow(radius: 2)
        })
    }
}


struct TextButton: View {

    var title: String
    var buttonAction: ()->() = {}
    
    var body: some View {
        Button(action: {
            self.buttonAction()
        }, label: {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.secondary
                )
        })
    }
}
