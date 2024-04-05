//
//  SubHeaderDetail.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct SubHeaderDetail<Content: View>: View {
    
    @ViewBuilder let content: () -> Content
    
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

