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
    case substraction = "−"
    case multiplication = "×"
    case division = "÷"
    
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType != nil {
            operand1String.append(contentsOf: digit)
            return operand1String
        } else {
            operand2String.append(contentsOf: digit)
            return operand2String
        }
        
    }
    
    func setOperator(_ operatorString: String) {
        
        switch operatorString {
        case "+":
            operatorType = .addition
        case "-":
            operatorType = .substraction
        case "×":
            operatorType = .multiplication
        case "÷":
            operatorType = .division
            
        default:
            ""
        }
    }
    
    func calculateIfPossible() -> String? {
        guard let operatorPressed = operatorType,
            let operand1 = Double(operand1String),
            let operand2 = Double(operand2String) else {
                return nil }
        
        switch operatorPressed {
        case .addition:
            return String(operand1 + operand2)
        case .substraction:
            return String(operand1 - operand2)
        case .multiplication:
            return String(operand1 * operand2)
        case .division:
            if operand2 != 0 {
                return String(operand2 / operand1)
            } else {
                return "Error"
            }
        }
    }
}



