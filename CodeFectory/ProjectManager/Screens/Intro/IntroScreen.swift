//
//  IntroScreen.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
//

import SwiftUI

struct IntroScreen: View {
    
    var screenSize: CGSize
    @State var offSet: CGFloat = 0
    @State var isShowLoginScreen = false
    
    var body: some View {
        NavigationView {
            VStack{
                OffSetTabView(offset: $offSet) {
                    HStack(spacing: 0){
                        ForEach(IntroList) { intro in
                            IntroSubView(intro: intro, screenSize: screenSize)
                        }
                    }
                }
                //Animated Indicator
                VStack(alignment: .center){
                    
                    HStack(spacing: 12, content: {
                        ForEach(IntroList.indices, id: \.self) { index in
                            Capsule()
                                .fill(Color.black)
                                .frame(width: getIndex() == index ? 20 : 7, height: 7)
                        }
                    })
                    .overlay(
                        Capsule()
                            .fill(Color.appOrange)
                            .frame(width: 20, height: 7)
                            .offset(x: getIndicatorOffset())
                        ,alignment: .leading
                    )
                    .offset(x: 0, y: -15)
                    
                    NavigationLink(
                        destination: LoginScreen(screenSize: screenSize),
                        isActive: self.$isShowLoginScreen,
                        label: {
                            ThemeButton(title: IntroList[getIndex()].buttonTitle, buttonAction: {
                                if getIndex() == IntroList.count - 1 {
                                    self.isShowLoginScreen = true
                                } else {
                                    let index = min(getIndex() + 1, IntroList.count - 1)
                                    offSet = CGFloat(index) * screenSize.width
                                }
                            })
                            .padding()
                        }).navigationBarBackButtonHidden(true)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .animation(.easeOut, value: getIndex())
            .navigationBarHidden(true)
            
            
            
        }
        
    }
    
    
    
    func getIndicatorOffset()-> CGFloat {
        let progress = offSet / screenSize.width
        
        // 12 = Spacing
        // 7 =  circle
        
        let maxWidth: CGFloat = 12 + 7
        return progress * maxWidth
    }
    
    func getIndex() -> Int {
        let progress = round(offSet / screenSize.width)
        let index = min(Int(progress), IntroList.count - 1)
        return index
    }
    
    
}

struct IntroScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct IntroSubView: View {
    var intro: IntroModel
    var screenSize: CGSize
    var body: some View {
        VStack{
            Image(intro.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: screenSize.height / 3, alignment: .center)
            
            VStack(alignment: .center, spacing: 20, content: {
                LargeTitleLabel(title: intro.title)
                DetailsLabel(detail: intro.details)
            })
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
        .frame(width: screenSize.width)
    }
}

