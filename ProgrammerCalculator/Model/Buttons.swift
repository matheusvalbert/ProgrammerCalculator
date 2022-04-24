//
//  Buttons.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 01/04/22.
//

import Foundation

//MARK: - published variables declaration active/desative
class Buttons: ObservableObject {
    
    @Published var hexadecimal = true
    @Published var decimal = false
    @Published var octal = false
    @Published var binary = false
    
    @Published var shl = true
    @Published var shr = true
    
    @Published var two = false
    @Published var three = false
    @Published var four = false
    @Published var five = false
    @Published var six = false
    @Published var seven = false
    @Published var eight = false
    @Published var nine = false
    @Published var a = false
    @Published var b = false
    @Published var c = false
    @Published var d = false
    @Published var e = false
    @Published var f = false
}

//MARK: - activate/desativate buttons cases and change base
extension Buttons {
    
    //input base change
    func changeBase(base: String) {
        switch base {
        case "hex":
            hexadecimal = true
            decimal = false
            octal = false
            binary = false
            
            shl = true
            shr = true
            
            two = false
            three = false
            four = false
            five = false
            six = false
            seven = false
            eight = false
            nine = false
            a = false
            b = false
            c = false
            d = false
            e = false
            f = false
            
        case "dec":
            hexadecimal = false
            decimal = true
            octal = false
            binary = false
            
            shl = true
            shr = true
            
            two = false
            three = false
            four = false
            five = false
            six = false
            seven = false
            eight = false
            nine = false
            a = true
            b = true
            c = true
            d = true
            e = true
            f = true
            
        case "oct":
            hexadecimal = false
            decimal = false
            octal = true
            binary = false
            
            shl = true
            shr = true
            
            two = false
            three = false
            four = false
            five = false
            six = false
            seven = false
            eight = true
            nine = true
            a = true
            b = true
            c = true
            d = true
            e = true
            f = true
            
        case "bin":
            hexadecimal = false
            decimal = false
            octal = false
            binary = true
            
            shl = false
            shr = false
            
            two = true
            three = true
            four = true
            five = true
            six = true
            seven = true
            eight = true
            nine = true
            a = true
            b = true
            c = true
            d = true
            e = true
            f = true
            
        default:
            break
        }
    }
}
