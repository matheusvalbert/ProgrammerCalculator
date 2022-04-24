//
//  Calculator.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 19/04/22.
//

import Foundation

//MARK: - variable declaration
class Calculator: ObservableObject {
    
    //equation to be calculated
    @Published var equation = "0"
    
    //equation prepared to calculate
    var equationToCalculate = "0"
    
    //main result
    var mainResult = 0
    
    //number opened parentheses
    var openedParentheses = 0
    
    //number closed parentheses
    var closedParentheses = 0
    
    //active base
    var base = "hex"
    
    //base results
    @Published var hexResult = "0"
    @Published var decResult = "0"
    @Published var octResult = "0"
    @Published var binResult = "0"
}

//MARK: - concats to equation and remove
extension Calculator {
    
    func concatToEquation(character: Character) {
        
        //if result equals 0, remove initial 0 and insert pressed character
        if equation == "0" {
            equation = String(character)
            return
        }
        
        if equation.last == ")" {
            equation += "×"
        }
        
        //concat new character
        equation += String(character)
    }
    
    func concatOperationToEquation(character: Character) {
        
        //check if has number != 0 || check if is a parentheses || check if last character is an operation
        if equation == "0" || equation.last == "(" {
            return
        }
        
        //check if last character is an operation and change for new operation
        if equation.last == "÷" || equation.last == "×" || equation.last == "-" || equation.last == "+" {
            equation = String(equation.dropLast())
            equation += String(character)
            return
        }
        
        //concat operation
        equation += String(character)
    }
    
    //remove last character
    func removeCharacter() {
        
        //check if is zero
        if equation == "0" {
            return
        }
        
        //check if has a single number
        if equation.count == 1 {
            equation = "0"
            return
        }
        
        //remove last character
        equation = String(equation.dropLast())
    }
    
    //reset calculator
    func resetCalculator() {
        equation = "0"
        mainResult = 0
        hexResult = "0"
        decResult = "0"
        octResult = "0"
        binResult = "0"
        openedParentheses = 0
        closedParentheses = 0
    }
}

// MARK: - parentheses cases
extension Calculator {
    
    //open parentheses
    func openParentheses() {
        
        if(equation.last == "(") {
            equation += "("
            openedParentheses += 1
            return
        }
        
        if(equation == "0") {
            equation = "("
            openedParentheses += 1
            return
        }
        
        if equation.last != "÷" && equation.last != "×" && equation.last != "-" && equation.last != "+" {
            equation += "×"
        }
        
        equation += "("
        
        openedParentheses += 1
    }
    
    // close parentheses
    func closeParentheses() {
        
        if closedParentheses >= openedParentheses || equation.last == "(" {
            return
        }
        
        equation += ")"
        
        closedParentheses += 1
    }
}

//MARK: - fix equation
extension Calculator {
    
    //add missing parentheses
    func fixParenthese() {
        
        //new opened and closed parentheses
        var newOpenedParentheses = openedParentheses
        var newClosedParentheses = closedParentheses
        
        //check number of opened parentheses
        if newOpenedParentheses == 0 { return }
        
        //count how many parentheses are opened in the end of operation
        var countOpenedParentheses = 0
        
        //loop to remove end parentheses operation
        for _ in 1...newOpenedParentheses {
            if equationToCalculate.last == "(" {
                equationToCalculate = String(equationToCalculate.dropLast())
                countOpenedParentheses += 1
            }
        }
        
        //remove from counter
        newOpenedParentheses -= countOpenedParentheses
        
        // count how many valid parentheses but not closed
        let addCloseParentheses = newOpenedParentheses - newClosedParentheses
        
        //check if has
        if addCloseParentheses == 0 { return }
        
        // closed valid parentheses
        for _ in 1...addCloseParentheses {
            equationToCalculate += ")"
            newClosedParentheses += 1
        }
    }
    
    // fix if last character is an operation
    func fixLastCharacter() {
        
        if equationToCalculate.last == "÷" || equationToCalculate.last == "×" || equationToCalculate.last == "-" || equationToCalculate.last == "+" {
            equationToCalculate = String(equationToCalculate.dropLast())
        }
    }
    
    //substitute symble to calculate operation
    func substituteOperationSymbol() {
        
        equationToCalculate = equationToCalculate.replacingOccurrences(of: "÷", with: "/")
        equationToCalculate = equationToCalculate.replacingOccurrences(of: "×", with: "*")
    }
    
    //check if has a equation, if not, make it 0
    func checkIfHasEquation() {
        if equationToCalculate.count == 0 {
            equationToCalculate = "0"
        }
    }
    
    //separate numbers from the expression
    func separeEquation() -> [String] {
        
        //bool array check number and letter
        var isNumberOrLetter: [Bool] = []
        
        //loop to separe number and letter
        for char in equationToCalculate.indices {
            if equationToCalculate[char].isNumber || equationToCalculate[char].isLetter {
                isNumberOrLetter.append(true)
            }
            else {
                isNumberOrLetter.append(false)
            }
        }
        
        //array with separated string
        var separatedEquation: [String] = []
        
        //new string to be appended
        var newString = ""
        
        //loop to separe
        for i in 0...isNumberOrLetter.count - 1 {
            if i != 0 && isNumberOrLetter[i-1] != isNumberOrLetter[i] {
                separatedEquation.append(newString)
                newString = ""
            }
            
            newString += String(equationToCalculate[equationToCalculate.index(equationToCalculate.startIndex, offsetBy: i)])
        }
        separatedEquation.append(newString)
        
        return separatedEquation
        
    }
    
    func changeBase(newEquation: [String]) {
        
        var finalEquation = ""
        
        newEquation.forEach { str in
            if str[str.index(str.startIndex, offsetBy: 0)].isNumber || str[str.index(str.startIndex, offsetBy: 0)].isLetter {
                switch base {
                case "hex":
                    let hex = Int(str, radix: 16)!
                    finalEquation += String(hex)
                case "dec":
                    finalEquation += str
                case "oct":
                    let oct = Int(str, radix: 8)!
                    finalEquation += String(oct)
                case "bin":
                    let bin = Int(str, radix: 2)!
                    finalEquation += String(bin)
                default:
                    finalEquation = "0"
                }
            }
            else {
                finalEquation += str
            }
        }
        
        equationToCalculate = finalEquation
    }
    
    //prepare to calculate result
    func prepareToCalculate() {
        
        equationToCalculate = equation
        
        fixParenthese()
        fixLastCharacter()
        substituteOperationSymbol()
        checkIfHasEquation()
        
        let newEquation = separeEquation()
        changeBase(newEquation: newEquation)
        
        calc()
        toHex()
        toDec()
        toOct()
        toBin()
    }
}

//MARK: - calculate equation and convert
extension Calculator {
    
    func calc() {
        let expression = NSExpression(format: equationToCalculate)
        let result = expression.expressionValue(with: nil, context: nil) as? Int
        mainResult = result ?? 0
    }
    
    func result() -> String {
        switch base {
        case "hex":
            return hexResult
        case "dec":
            return decResult
        case "oct":
            return octResult
        case "bin":
            return binResult
        default:
            return "0"
        }
    }
    
    func toEquation() {
        switch base {
        case "hex":
            equation = hexResult
        case "dec":
            equation = decResult
        case "oct":
            equation = octResult
        case "bin":
            equation = binResult
        default:
            break
        }
    }
    
    func toHex() {
        let hex = String(mainResult, radix: 16)
        hexResult = hex
    }
    
    func toDec() {
        decResult = String(mainResult)
    }
    
    func toOct() {
        let oct = String(mainResult, radix: 8)
        octResult = oct
    }
    
    func toBin() {
        let bin = String(mainResult, radix: 2)
        binResult = bin
    }
}

// MARK: - shifts
extension Calculator {
    //shift right equation
    func shiftRight() {
        equation = String(binResult.dropLast())
    }
    
    //shift left equation
    func shiftLeft() {
        equation = binResult + "0"
    }
}
