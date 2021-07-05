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
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?

    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType != nil {
            operand2String = operand2String + digit
            return operand2String
        } else {
            operand1String = operand1String + digit
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        if operatorString == "+" {
            operatorType = .addition
        } else if operatorString == "−" {
            operatorType = .subtraction
        } else if operatorString == "×" {
            operatorType = .multiplication
        } else {
            operatorType = .division
        }
    }
    
    func calculateIfPossible() -> String? {
        
        if operand1String != "" && operand2String != "" {
            
            if operatorType != nil {
                
                guard let operand1Double = Double(operand1String) else { return "Bug" }
                guard let operand2Double = Double(operand2String) else { return "Bug" }
                
                switch operatorType?.rawValue {
                case "+":
                    print("Addition")
                    return "\(operand1Double + operand2Double)"
                case "−":
                    print("Subtraction")
                    return "\(operand1Double - operand2Double)"
                case "×":
                    print("Multiplication")
                    return "\(operand1Double * operand2Double)"
                case "÷":
                    print("Division")
                    
                    if operand2Double == 0 {
                        return "Error"
                    } else {
                        return "\(operand1Double / operand2Double)"
                    }
                default:
                    print("Default")
                }
                }
            }
        
        return nil
    }
}
