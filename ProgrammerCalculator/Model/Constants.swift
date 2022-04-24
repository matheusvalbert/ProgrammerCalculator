//
//  Constants.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 20/03/22.
//

import Foundation
import UIKit

enum Constants {
    
    public static let w = CGFloat(UIScreen.main.bounds.width)
    public static let h = CGFloat(UIScreen.main.bounds.height)
    
    enum Buttons {
        public static let width = CGFloat(w/6)
        public static let widthZero = CGFloat(w/2.5)
        public static let height = CGFloat(h/15)
        public static let cornerRadius = CGFloat(h/50)
        public static let size = CGFloat(h/30)
        public static let padding = CGFloat(UIDevice.current.userInterfaceIdiom == .pad ? 10 : 3)
    }
    enum Results {
        public static let size = CGFloat(h/12)
        public static let sizeResult = CGFloat(h/20)
        public static let baseSize = CGFloat(h/30)
        public static let VSpacing = CGFloat(h/250)
        public static let HSpacing = CGFloat(w/100)
        public static let HSpacingDEC = CGFloat(w/80)
    }
    
    enum Rectangle {
        public static let width = CGFloat(w/70)
        public static let height = CGFloat(h/30)
    }
}
