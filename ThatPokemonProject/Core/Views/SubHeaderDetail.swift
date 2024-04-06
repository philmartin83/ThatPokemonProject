//
//  SubHeaderDetail.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct SubHeaderDetail<Content: View>: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    // MARK: - View Builder
    @ViewBuilder let content: () -> Content
    
    // MARK: - View
    var body: some View {
        let layout = dynamicTypeSize <= .xxLarge ? AnyLayout(HStackLayout(alignment: .center, spacing: 8)) : AnyLayout(VStackLayout(alignment: .center, spacing: 14))
        layout {
            content()
        }
    }
}

#Preview {
    SubHeaderDetail(content: {
        
    })
}

