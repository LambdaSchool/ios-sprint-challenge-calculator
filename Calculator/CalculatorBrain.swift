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
        if operatorType == OperatorType(rawValue: "") {
            operand1String += digit
            return operand1String
        } else {
            operand2String += digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "-":
            operatorType = .subtraction
        case "+":
            operatorType = .addition
        case "÷":
            operatorType = .division
        case "×":
            operatorType = .multiplication
        default:
            break
        }
    }
    
    func calculateIfPossible() -> String? {
        var resultOperand = 0.0

        if operand1String != "", operand2String != "", operatorType != nil {
            

        guard let firstOperand = Double(operand1String),  let secondOperand = Double(operand2String) else { return  nil}
        guard let unwrappedOperator = operatorType else { return nil}
        
            switch unwrappedOperator {
            case .addition:
                resultOperand = firstOperand + secondOperand
                return String(resultOperand)
            case .subtraction:
                resultOperand = firstOperand - secondOperand
                return String(resultOperand)
            case .multiplication:
                resultOperand = firstOperand * secondOperand
                return String(resultOperand)
            case .division:
                if secondOperand != 0.0 {
                resultOperand = firstOperand / secondOperand
                    return String(resultOperand)
                } else { return "Error"}
            }
        }
        return nil
    }
}
