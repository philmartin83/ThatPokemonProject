//
//  SubHeaderDetail.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct SubHeaderDetail<Content: View>: View {
    
    // MARK: - View Builder
    @ViewBuilder let content: () -> Content
    
    // MARK: - View
    var body: some View {
        HStack(spacing: 8) {
            content()
        }
    }
}

#Preview {
    SubHeaderDetail(content: {
        
    })
}

