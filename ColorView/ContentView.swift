//
//  ContentView.swift
//  ColorView
//
//  Created by Aleksey Konchyts on 19.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    
    
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 150)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black, lineWidth: 4)
                )
                .foregroundStyle(
                    Color(
                        red: redSliderValue / 255 ,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255)
                )
            
            ColorSliderView(sliderValue: $redSliderValue, sliderColor: .red)
            ColorSliderView(sliderValue: $greenSliderValue, sliderColor: .green)
            ColorSliderView(sliderValue: $blueSliderValue, sliderColor: .blue)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double
    
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text(lround(sliderValue).formatted())
                .font(.title)
            Spacer()
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(sliderColor)
                .frame(width: 255)
        }
    }
}
