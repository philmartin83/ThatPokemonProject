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
        
        HStack(spacing: 4) {
            if !icon.isEmpty {
                Image(systemName: icon)
                    .font(.headline)
                    .foregroundStyle(.gray.opacity(0.4))
            }
            VStack(spacing: 4) {
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

