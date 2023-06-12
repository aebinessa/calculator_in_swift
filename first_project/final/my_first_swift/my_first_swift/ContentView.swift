//
//  ContentView.swift
//  my_first_swift
//
//  Created by Abdullah Bin Essa on 6/4/23.
//

import SwiftUI


enum calculatorMode {
    case notSet
    case addition
    case subtraction
    case multiplication
}

struct ContentView: View {
     @State var currentValue = "0"
     @State var currentMode: calculatorMode = .notSet
     @State var lastButtonWasMode = false
     @State var savedNum = 0
     @State var currentValueInt = 0
    
    var body: some View {
        
        ZStack {
            Color(.black)
            VStack {
                totalText(value: currentValue)
                HStack {
                    calculatorButton(buttonText: "1", action: didPressNumber)
                    calculatorButton(buttonText: "2", action: didPressNumber)
                    calculatorButton(buttonText: "3", action: didPressNumber)
                    calculatorButton(buttonText: "+", buttonColor: .orange, action: didPressMode, mode: .addition)

                }
                HStack {
                    calculatorButton(buttonText: "4", action: didPressNumber)
                    calculatorButton(buttonText: "5", action: didPressNumber)
                    calculatorButton(buttonText: "6", action: didPressNumber)
                    calculatorButton(buttonText: "-", buttonColor: .orange, action: didPressMode, mode: .subtraction)

                }
                HStack {
                    calculatorButton(buttonText: "7", action: didPressNumber)
                    calculatorButton(buttonText: "8", action: didPressNumber)
                    calculatorButton(buttonText: "9", action: didPressNumber)
                    calculatorButton(buttonText: "x ", buttonColor: .orange, action: didPressMode, mode: .multiplication)

                }
                HStack {
                    calculatorButton(buttonText: "0",buttonWidth: 148, action: didPressNumber )
                    calculatorButton(buttonText: "C", action: didPressClear)
                    calculatorButton(buttonText: "=", buttonColor: .orange, action: didPressEquals)

                }
            }
            
            
        }
        .ignoresSafeArea()
        }
    func didPressNumber(button: calculatorButton){
        if lastButtonWasMode{
            lastButtonWasMode = false
            currentValueInt = 0
        }
        if let parsedValue = Int("\(currentValueInt)" + button.buttonText){
            currentValueInt = parsedValue
            updateText()
        }
        else{
            currentValue = "Error"
            currentValueInt = 0
        }
        
    }
    func didPressMode(button: calculatorButton){
        currentMode = button.mode
        lastButtonWasMode = true
        print(currentMode)
    }
    func didPressEquals(button: calculatorButton){
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        if currentMode == .addition {
            savedNum += currentValueInt
        } else if currentMode == .subtraction{
            savedNum -= currentValueInt
        } else if currentMode == .multiplication {
            savedNum *= currentValueInt
        }
        
        currentValueInt = savedNum
        updateText()
        lastButtonWasMode = true
    }
    func didPressClear(button: calculatorButton){
         currentValue = "0"
         currentMode = .notSet
         lastButtonWasMode = false
         savedNum = 0
         currentValueInt = 0
           }
    func updateText(){
        if currentMode == .notSet {
            savedNum = currentValueInt
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let num = NSNumber(value: currentValueInt)
        currentValue = numberFormatter.string(from: num) ?? "ERROR"
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
