//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType != nil {
            operand1String.append(digit)
            return operand1String
        } else {
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        if operand1String.isEmpty, operand2String.isEmpty, operatorType == nil {
            return "0"
            // this is saying if nothing has been entered, the default value in the output screen will say 0 until it's changed.
        } else {
            var calculatedAnswer: String
            if let num1 = Double(operand1String), let num2 = Double(operand2String) {
                // type-casting is done here
                guard operatorType != nil else {
                    print("0")
                    return "0"
                }
                switch operatorType {
                case .addition?:
                    calculatedAnswer = String(num1 + num2)
                case .subtraction?:
                    calculatedAnswer = String(num2 - num1)
                case .multiplication?:
                    calculatedAnswer = String(num1 * num2)
                case .division?:
                    calculatedAnswer = String(num2 / num1)
                    
                default: // I'm not gonna lie, I had nil } and had an error, so I tried that and it magically worked. Not sure if it's right? I've never seen that before.
                    
                    return nil}} else {
                return nil
            }
            operand1String = calculatedAnswer
            operand2String = ""
            return calculatedAnswer
        }
    }
    func clear() {
        operand1String = ""
        operand2String = ""
        operatorType = nil
    }
}
// this makes it default back to 0 on the screen
