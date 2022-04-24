//
//  Result.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 22/03/22.
//

import SwiftUI

struct Result: View {
    @EnvironmentObject var calculator: Calculator
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Equation(equation: calculator.equation)
            }
            HStack {
                Spacer()
                MainResult(result: calculator.equation == "0" || calculator.equation == calculator.result() ? "" : calculator.result())
            }
        }
        .padding(.horizontal)
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result()
            .environmentObject(Calculator())
        Result()
            .preferredColorScheme(.dark)
            .environmentObject(Calculator())
    }
}
