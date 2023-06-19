//
//  ColorView.swift
//  ColorizedAppSUI
//
//  Created by Келлер Дмитрий on 19.06.2023.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double

    var body: some View {
        Color(red: red/255, green: green/255, blue: blue/255)
            .cornerRadius(20)
            .frame(width: 340, height: 170)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 2)
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 100, green: 100, blue: 100)
    }
}
