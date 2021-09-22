//
//  ThemeLabel.swift
//  CodeFectory
//
//  Created by DREAMWORLD on 22/09/21.
//

import SwiftUI

struct LargeTitleLabel: View {
    var title: String
    var body: some View {
        Text(title)
            .font(Font.largeTitle.bold())
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
    }
}


struct TitleLabel: View {
    var title: String
    var body: some View {
        Text(title)
            .font(Font.title.bold())
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
    }
}


struct DetailsLabel: View {
    var detail: String
    var body: some View {
        Text(detail)
            .fontWeight(.semibold)
            .lineLimit(nil)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundColor(.secondary)
    }
}


struct SubHeadingLabel: View {
    var detail: String
    var body: some View {
        Text(detail)
            .font(.caption)
            .lineLimit(nil)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundColor(.secondary)
    }
}
