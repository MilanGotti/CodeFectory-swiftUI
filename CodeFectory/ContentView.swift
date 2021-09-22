//
//  ContentView.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            IntroScreen(screenSize: size)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
