//
//  SpinningProgress.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 06/04/2024.
//

import SwiftUI

struct SpinningProgress: View {
    
    var scale: CGFloat = 0.7
    
    var body: some View {
        ProgressView()
            .tint(.primary)
            .scaleEffect(scale)
    }
}

#Preview {
    SpinningProgress()
}
