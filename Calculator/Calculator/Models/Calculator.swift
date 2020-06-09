//
//  Calculator.swift
//  Calculator
//
//  Created by Claudia Cavalini Maganhi on 08/06/20.
//  Copyright © 2020 Claudia Cavalini Maganhi. All rights reserved.
//

import Foundation

struct Calculator {
    
    private var number: Double?
    private var intermediateCalculation: (number1: Double, operator: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let number = number {
            switch symbol {
            case "AC":
                return 0.0
            case "+/-":
                return number * -1.0
            case "%":
                return number * 0.01
            case "=":
                return performTwoNumberCalculation(number2: number)
            default:
                intermediateCalculation = (number1: number, operator: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(number2: Double) -> Double? {
        if let number1 = intermediateCalculation?.number1, let operation = intermediateCalculation?.operator {
            switch operation {
            case "+":
                return number1 + number2
            case "-":
                return number1 - number2
            case "x":
                return number1 * number2
            case "÷":
                return number1 / number2
            default:
                fatalError("The operation doest match any of the cases")
            }
        }
        return nil
    }
    
}
