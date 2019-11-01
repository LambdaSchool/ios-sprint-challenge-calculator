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
    case multiplication = "x"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        switch operatorType {
        case nil:
            if digit == "." && operand1String == "" {
                operand1String = "0"
            }
            operand1String = operand1String + digit
            return operand1String
        default:
            if digit == "." && operand2String == "" {
                operand2String = "0"
            }
            operand2String = operand2String + digit
            return operand2String
            }
        }
    
    func setOperator(_ operatorString: String) {
        
        switch operatorString {
        case "+":
            operatorType = .addition
        case "-":
            operatorType = .subtraction
        case "x":
            operatorType = .multiplication
        case "÷":
            operatorType = .division
        default:
            break
        }
    }
    
    func calculateIfPossible() -> String? {
        guard let operand1 = Double(operand1String),
            let operand2 = Double(operand2String) else {
                return nil
        }
        guard let operatorType = operatorType else {
            return nil
        }
        
        switch operatorType {
        case .addition:
            return String(describing: operand1 + operand2)
        case .subtraction:
            return String(describing: operand1 - operand2)
        case .multiplication:
            return String(describing: operand1 * operand2)
        case .division:
            if operand2 == 0 {
                return "Error"
            } else {
                return String(describing: operand1 / operand2)
            }
        }
    }
}
