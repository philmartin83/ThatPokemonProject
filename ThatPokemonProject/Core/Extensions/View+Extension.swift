//
//  View+Extension.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

extension View {
    func onFirstAppear(_ onFirstAppearAction: @escaping () -> () ) -> some View {
        modifier(OnFirstAppearModifier(onFirstAppearAction))
    }
}
