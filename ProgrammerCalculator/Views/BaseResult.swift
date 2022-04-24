//
//  BaseResult.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 22/03/22.
//

import SwiftUI

//struct BaseResult: View {
//    @EnvironmentObject var buttons: Buttons
//    @EnvironmentObject var calculator: Calculator
//
//    var body: some View {
//        HStack(alignment: .center) {
//            VStack(alignment: .leading, spacing: Constants.Results.VSpacing) {
//                Button(action: {
//                    buttons.changeBase(base: "hex")
//                    calculator.base = "hex"
//                    calculator.toEquation()
//                }) {
//                    HStack(spacing: Constants.Results.HSpacing) {
//                        SelectedBase(selected: buttons.hexadecimal)
//                        ResultTextBase(text: "H E X")
//                    }
//                }
//                Button(action: {
//                    buttons.changeBase(base: "dec")
//                    calculator.base = "dec"
//                    calculator.toEquation()
//                }) {
//                    HStack(spacing: Constants.Results.HSpacingDEC) {
//                        SelectedBase(selected: buttons.decimal)
//                        ResultTextBase(text: "D E C")
//                    }
//                }
//                Button(action: {
//                    buttons.changeBase(base: "oct")
//                    calculator.base = "oct"
//                    calculator.toEquation()
//                }) {
//                    HStack(spacing: Constants.Results.HSpacing) {
//                        SelectedBase(selected: buttons.octal)
//                        ResultTextBase(text: "O C T")
//                    }
//                }
//                Button(action: {
//                    buttons.changeBase(base: "bin")
//                    calculator.base = "bin"
//                    calculator.toEquation()
//                }) {
//                    HStack(spacing: Constants.Results.HSpacing) {
//                        SelectedBase(selected: buttons.binary)
//                        ResultTextBase(text: "B  I  N")
//                    }
//                }
//            }
//            .padding(.trailing)
//            VStack(alignment: .leading, spacing: Constants.Results.VSpacing) {
//                ResultText(result: calculator.hexResult)
//                ResultText(result: calculator.decResult)
//                ResultText(result: calculator.octResult)
//                ResultText(result: calculator.binResult)
//            }
//            Spacer()
//        }
//    }
//}

struct BaseResult: View {
    @EnvironmentObject var buttons: Buttons
    @EnvironmentObject var calculator: Calculator
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.Results.VSpacing) {
            
            HStack(alignment: .center) {
                Button(action: {
                    buttons.changeBase(base: "hex")
                    calculator.base = "hex"
                    calculator.toEquation()
                }) {
                    HStack(spacing: Constants.Results.HSpacing) {
                        SelectedBase(selected: buttons.hexadecimal)
                        ResultTextBase(text: "H E X")
                    }
                }
                ResultText(result: calculator.hexResult)
                Spacer()
            }
                
            HStack(alignment: .center) {
                Button(action: {
                    buttons.changeBase(base: "dec")
                    calculator.base = "dec"
                    calculator.toEquation()
                }) {
                    HStack(spacing: Constants.Results.HSpacingDEC) {
                        SelectedBase(selected: buttons.decimal)
                        ResultTextBase(text: "D E C")
                    }
                }
                ResultText(result: calculator.decResult)
                Spacer()
            }
                
            HStack(alignment: .center) {
                Button(action: {
                    buttons.changeBase(base: "oct")
                    calculator.base = "oct"
                    calculator.toEquation()
                }) {
                    HStack(spacing: Constants.Results.HSpacing) {
                        SelectedBase(selected: buttons.octal)
                        ResultTextBase(text: "O C T")
                    }
                }
                ResultText(result: calculator.octResult)
                Spacer()
            }
                
            HStack(alignment: .center) {
                Button(action: {
                    buttons.changeBase(base: "bin")
                    calculator.base = "bin"
                    calculator.toEquation()
                }) {
                    HStack(spacing: Constants.Results.HSpacing) {
                        SelectedBase(selected: buttons.binary)
                        ResultTextBase(text: "B  I  N")
                    }
                }
                ResultText(result: calculator.binResult)
                Spacer()
            }
        }
    }
}

struct BaseResult_Previews: PreviewProvider {
    static var previews: some View {
        BaseResult()
            .environmentObject(Buttons())
            .environmentObject(Calculator())
        BaseResult()
            .preferredColorScheme(.dark)
            .environmentObject(Buttons())
            .environmentObject(Calculator())
    }
}
