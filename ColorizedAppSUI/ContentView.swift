//
//  ContentView.swift
//  ColorizedAppSUI
//
//  Created by Келлер Дмитрий on 13.06.2023.
//


import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color("backgroundBlue")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 35) {
                ColorView(
                    red: $redSliderValue,
                    green: $greenSliderValue,
                    blue: $blueSliderValue
                )
                
                СontrolPanelView(value: $redSliderValue, color: .red)
                СontrolPanelView(value: $greenSliderValue, color: .green)
                СontrolPanelView(value: $blueSliderValue, color: .blue)
                
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        Rectangle()
            .fill(Color(red: red/255, green: green/255, blue: blue/255))
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 2))
            .frame(width: 340, height: 170)
            .cornerRadius(20)
    }
}

struct СontrolPanelView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(color)
                .frame(width: 40)
                .fontWeight(.bold)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .frame(width: 238)
            
            TextField("", value: $value, formatter: NumberFormatter(), onCommit: { })
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50)
                .onChange(of: value) { newValue in
                    if newValue < 0 {
                        value = 0
                    } else if newValue > 255 {
                        value = 255
                    } else {
                        value = newValue
                    }
                }
        }
    }
}

