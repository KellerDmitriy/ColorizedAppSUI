//
//  ContentView.swift
//  ColorizedAppSUI
//
//  Created by Келлер Дмитрий on 13.06.2023.
//


import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    @FocusState private var  isInputActive: Bool
    
    var body: some View {
        // ZStack для модификатора .onTapGesture
        // Без использования ZStack область жестов
        // Ограничивается вертикальным стеком, который
        // Заканчивается сразу после слайдеров
        ZStack {
            VStack(spacing: 35) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, color: .red)
                    ColorSliderView(value: $green, color: .green)
                    ColorSliderView(value: $blue, color: .blue)
                }
                .frame(height: 150)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Spacer()//для того чтобы кнопку на клавиатуре разместить справа
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                Spacer()
            }
        }
        .padding()
        .background(Color("backgroundBlue"))
        .onTapGesture {
            isInputActive = false
        }
    }
}
                    
struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
                    
                    
