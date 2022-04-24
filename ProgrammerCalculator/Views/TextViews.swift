//
//  TextViews.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 20/03/22.
//

import SwiftUI

struct Equation: View {
    var equation: String
    
    var body: some View {
        Text(equation)
            .scaledToFit()
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(height: (Constants.Results.size * 0.95))
            .font(Font.system(size: Constants.Results.size, design: .default))
            .foregroundColor(Color("Text"))
    }
}

struct MainResult: View {
    var result: String
    
    var body: some View {
        Text(result)
            .scaledToFit()
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(height: (Constants.Results.sizeResult * 0.95))
            .font(Font.system(size: Constants.Results.sizeResult, design: .default))
            .foregroundColor(Color("TextResult"))
    }
}

struct ResultTextBase: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(Font.system(size: Constants.Results.baseSize, design: .default))
            .fontWeight(.bold)
            .foregroundColor(Color("Text"))
    }
}

struct SelectedBase: View {
    var selected: Bool
    
    var body: some View {
        Rectangle()
            .fill(selected == true ? Color("OperationButton") : Color("Background"))
            .frame(width: Constants.Rectangle.width, height: Constants.Rectangle.height)
    }
}

struct ResultText: View {
    var result: String
    
    var body: some View {
        Text(result)
            .scaledToFit()
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .font(Font.system(size: Constants.Results.baseSize, design: .default))
            .foregroundColor(Color("Text"))
    }
}

struct PreviewViewText: View {
    var body: some View {
        VStack(spacing: 10) {
            Equation(equation: "0")
            MainResult(result: "0")
            ResultTextBase(text: "HEX")
            SelectedBase(selected: true)
            ResultText(result: "0")
        }
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewViewText()
        PreviewViewText()
            .preferredColorScheme(.dark)
    }
}
