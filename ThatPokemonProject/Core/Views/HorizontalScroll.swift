//
//  HorizontalScroll.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct HorizontalScroll<Content: View>: View {
    
    // MARK: - ViewBuilder
    @ViewBuilder let content: () -> Content
    
    // MARK: - View
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
              content()
            }
        }
    }
}

#Preview {
    HorizontalScroll {
        
    }
}

