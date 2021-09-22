//
//  IntroModel.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
//

import Foundation
import SwiftUI

struct IntroModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var details: String
    var buttonTitle: String
}

var IntroList: [IntroModel] = [
    IntroModel(image: "intro1", title: "Learn anytime and anywhere", details: "Quarantine is the perfect time to spend your day learning something new, from anywhere!", buttonTitle: "Next"),
    IntroModel(image: "intro2", title: "Find a course for you", details: "Quarantine is the perfect time to spend your day learning something new, from anywhere!", buttonTitle: "Next"),
    IntroModel(image: "intro3", title: "Improve your skills", details: "Quarantine is the perfect time to spend your day learning something new, from anywhere!", buttonTitle: "Let's Start")
]
