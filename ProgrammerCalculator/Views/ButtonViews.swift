//
//  Buttons.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 20/03/22.
//

import SwiftUI

struct FunctionButton: View {
    var text: String
    var disabled: Bool
    
    var body: some View {
        Text(text)
            .font(Font.system(size: Constants.Buttons.size, design: .default))
            .foregroundColor(disabled ? Color("TextDisabled") : Color("Text"))
            .frame(width: Constants.Buttons.width, height: Constants.Buttons.height)
            .background(
                RoundedRectangle(cornerRadius: Constants.Buttons.cornerRadius)
                    .foregroundColor(disabled ? Color("ButtonDisabled") : Color("FunctionButton"))
            )
    }
}

struct ButtonValue: View {
    var text: String
    var disabled: Bool
    
    var body: some View {
        Text(text)
            .font(Font.system(size: Constants.Buttons.size, design: .default))
            .foregroundColor(disabled ? Color("TextDisabled") : Color("Text"))
            .frame(width: Constants.Buttons.width, height: Constants.Buttons.height)
            .background(
                RoundedRectangle(cornerRadius: Constants.Buttons.cornerRadius)
                    .foregroundColor(disabled ? Color("ButtonDisabled") : Color("Button"))
            )
    }
}

struct ButtonZero: View {
    var body: some View {
        Text("0")
            .font(Font.system(size: Constants.Buttons.size, design: .default))
            .foregroundColor(Color("Text"))
            .frame(width: Constants.Buttons.widthZero, height: Constants.Buttons.height)
            .background(
                RoundedRectangle(cornerRadius: Constants.Buttons.cornerRadius)
                    .foregroundColor(Color("Button"))
            )
    }
}

struct DeleteButton: View {
    
    var body: some View {
        Image(systemName: "delete.backward")
            .font(Font.system(size: Constants.Buttons.size, design: .default))
            .foregroundColor(Color("Text"))
            .frame(width: Constants.Buttons.width, height: Constants.Buttons.height)
            .background(
                RoundedRectangle(cornerRadius: Constants.Buttons.cornerRadius)
                    .foregroundColor(Color("Button"))
            )
    }
}

struct OperationButton: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(Font.system(size: Constants.Buttons.size, design: .default))
            .foregroundColor(Color("OperationButtonText"))
            .frame(width: Constants.Buttons.width, height: Constants.Buttons.height)
            .background(
                RoundedRectangle(cornerRadius: Constants.Buttons.cornerRadius)
                    .foregroundColor(Color("OperationButton"))
            )
    }
}

struct PreviewViewButton: View {
    var body: some View {
        VStack(spacing: 10) {
            FunctionButton(text: "C", disabled: false)
            ButtonValue(text: "1", disabled: false)
            ButtonZero()
            DeleteButton()
            OperationButton(systemName: "divide")
        }
    }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewViewButton()
        PreviewViewButton()
            .preferredColorScheme(.dark)
    }
}
