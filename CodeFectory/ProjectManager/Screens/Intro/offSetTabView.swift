//
//  offSetTabView.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
///

import SwiftUI

struct OffSetTabView<Content: View>: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return OffSetTabView.Coordinator(parent: self)
    }
    
    
    var content: Content
    @Binding var offSet: CGFloat
    
    init( offset: Binding<CGFloat>, @ViewBuilder content: @escaping ()-> Content) {
        self.content = content()
        self._offSet = offset
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        
        //Extracting SwiftUI view and embedding into UIKit
        let hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostView.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            
        ]
        
        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)
        
        //Enabling Paging
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        let currentOffset = uiView.contentOffset.x
        if currentOffset != offSet {
            uiView.setContentOffset(CGPoint(x: offSet, y: 0), animated: true)
        }
    }
    
    //page Offset
    
    class Coordinator: NSObject, UIScrollViewDelegate{
        
        var parent: OffSetTabView
        
        init(parent: OffSetTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            parent.offSet = offset
        }
        
        
    }
    
    
}


struct OffSetTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
