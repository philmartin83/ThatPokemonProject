//
//  TagView.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct TagView: View {
    
    
    // MARK: - Properties
    var title: String
    var alignment: TextAlignment = .center
    var colour: Color
    
    
    // MARK: - View
    var body: some View {
        Text(title.capitalized)
            .multilineTextAlignment(alignment)
            .foregroundStyle(colour)
            .fontWeight(.semibold)
            .font(.caption)
            .padding([.leading, .trailing])
            .padding(.top, 5)
            .padding(.bottom, 5)
            .background(.white)
            .clipShape(Capsule())
    }
}


#Preview {
    TagView(title: "Test", colour: Color.red)
}
