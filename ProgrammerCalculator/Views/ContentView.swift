//
//  ContentView.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 20/03/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var buttons = Buttons()
    @StateObject var calculator = Calculator()
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                Result()
                Spacer()
                BaseResult()
                Spacer()
                Keyboard()
            }
        }
        .environmentObject(buttons)
        .environmentObject(calculator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
