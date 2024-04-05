//
//  HorizontalScroll.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct HorizontalScroll<Content: View>: View {
    
    @ViewBuilder let content: () -> Content
    
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

