//
//  Keyboard.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 21/03/22.
//

import SwiftUI

struct Keyboard: View {
    var body: some View {
        VStack {
            LineZero()
                .padding(.bottom, Constants.Buttons.padding)
            LineOne()
                .padding(.bottom, Constants.Buttons.padding)
            LineTwo()
                .padding(.bottom, Constants.Buttons.padding)
            LineThree()
                .padding(.bottom, Constants.Buttons.padding)
            LineFour()
                .padding(.bottom, Constants.Buttons.padding)
            LineFive()
                .padding(.bottom, Constants.Buttons.padding)
            LineSix()
                .padding(.bottom, UIDevice.current.userInterfaceIdiom == .pad ? 15 : 10)
        }
    }
}

struct LineZero: View {
    @EnvironmentObject var buttons: Buttons
    @EnvironmentObject var calculator: Calculator
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                calculator.resetCalculator()
            }) {
                FunctionButton(text: calculator.equation == "0" ? "AC" : "C", disabled: false)
            }
            Spacer()
            Button(action: {
                calculator.openParentheses()
            }) {
                FunctionButton(text: "(", disabled: false)
            }
            Spacer()
            Button(action: {
                calculator.closeParentheses()
            }) {
                FunctionButton(text: ")", disabled: false)
            }
            Spacer()
            Button(action: {
                calculator.shiftLeft()
                calculator.prepareToCalculate()
            }) {
                FunctionButton(text: "<<", disabled: buttons.shl)
            }
            .disabled(buttons.shl)
            Spacer()
        }
    }
}

struct LineOne: View {
    @EnvironmentObject var buttons: Buttons
    @EnvironmentObject var calculator: Calculator
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "D")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "D", disabled: buttons.d)
            }
            .disabled(buttons.d)
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "E")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "E", disabled: buttons.e)
            }
            .disabled(buttons.e)
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "F")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "F", disabled: buttons.f)
            }
            .disabled(buttons.f)
            Spacer()
            Button(action: {
                calculator.shiftRight()
                calculator.prepareToCalculate()
            }) {
                FunctionButton(text: ">>", disabled: buttons.shr)
            }
            .disabled(buttons.shr)
            Spacer()
        }
    }
}

struct LineTwo: View {
    @EnvironmentObject var buttons: Buttons
    @EnvironmentObject var calculator: Calculator
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "A")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "A", disabled: buttons.a)
            }
            .disabled(buttons.a)
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "B")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "B", disabled: buttons.b)
            }
            .disabled(buttons.b)
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "C")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "C", disabled: buttons.c)
            }
            .disabled(buttons.c)
            Spacer()
            Button(action: {
                calculator.concatOperationToEquation(character: "÷")
            }) {
                OperationButton(systemName: "divide")
            }
            Spacer()
        }
    }
}

struct LineThree: View {
    @EnvironmentObject var buttons: Buttons
    @EnvironmentObject var calculator: Calculator
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "7")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "7", disabled: buttons.seven)
            }
            .disabled(buttons.seven)
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "8")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "8", disabled: buttons.eight)
            }
            .disabled(buttons.eight)
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "9")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "9", disabled: buttons.nine)
            }
            .disabled(buttons.nine)
            Spacer()
            Button(action: {
                calculator.concatOperationToEquation(character: "×")
            }) {
                OperationButton(systemName: "multiply")
            }
            Spacer()
        }
    }
}

struct LineFour: View {
    @EnvironmentObject var buttons: Buttons
    @EnvironmentObject var calculator: Calculator
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "4")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "4", disabled: buttons.four)
            }
            .disabled(buttons.four)
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "5")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "5", disabled: buttons.five)
            }
            .disabled(buttons.five)
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "6")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "6", disabled: buttons.six)
            }
            Spacer()
            Button(action: {
                calculator.concatOperationToEquation(character: "-")
            }) {
                OperationButton(systemName: "minus")
            }
            Spacer()
        }
    }
}

struct LineFive: View {
    @EnvironmentObject var buttons: Buttons
    @EnvironmentObject var calculator: Calculator
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "1")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "1", disabled: false)
            }
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "2")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "2", disabled: buttons.two)
            }
            .disabled(buttons.two)
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "3")
                calculator.prepareToCalculate()
            }) {
                ButtonValue(text: "3", disabled: buttons.three)
            }
            .disabled(buttons.three)
            Spacer()
            Button(action: {
                calculator.concatOperationToEquation(character: "+")
            }) {
                OperationButton(systemName: "plus")
            }
            Spacer()
        }
    }
}

struct LineSix: View {
    @EnvironmentObject var calculator: Calculator
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                calculator.concatToEquation(character: "0")
                calculator.prepareToCalculate()
            }) {
                ButtonZero()
            }
            Spacer()
            Button(action: {
                calculator.removeCharacter()
                calculator.prepareToCalculate()
            }) {
                DeleteButton()
            }
            Spacer()
            Button(action: {
                calculator.prepareToCalculate()
                calculator.toEquation()
            }) {
                OperationButton(systemName: "equal")
            }
            Spacer()
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
            .environmentObject(Buttons())
            .environmentObject(Calculator())
        Keyboard()
            .preferredColorScheme(.dark)
            .environmentObject(Buttons())
            .environmentObject(Calculator())
    }
}
