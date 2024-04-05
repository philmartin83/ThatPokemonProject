//
//  SubDetail.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct SubDetail: View {
    
    // MARK: - Properties
    let title: String
    let bodyText: String
    let icon: String
    var shouldAddDivider: Bool = true
    
    // MARK: - View
    var body: some View {
        HStack(spacing: 16) {
            if !icon.isEmpty {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.gray.opacity(0.4))
            }
            VStack(spacing: 8) {
                Text(bodyText)
                    .font(.subheadline)
                Text(title)
                    .font(.caption)
                    .fontWeight(.thin)
            }
        }
        .padding(.horizontal)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(title) \(bodyText)")
    }
}

#Preview {
    SubDetail(title: "My Title", bodyText: "My body text", icon: "")
}

