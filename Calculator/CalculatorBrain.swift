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
            operand2String += digit
            return operand2String
        } else {
            operand1String += digit
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+":
            operatorType = .addition
        case "−":
            operatorType = .subtraction
        case "×":
            operatorType = .multiplication
        case "÷":
            operatorType = .division
        default:
            operatorType = nil
        }
    }
    
    func calculateIfPossible() -> String? {
        guard let operand1 = Double(operand1String) else {return nil}
        guard let operand2 = Double(operand2String) else {return nil}
        guard let operatorType = operatorType else {return nil}
        switch operatorType {
        case .addition:
            return "\(operand1 + operand2)"
        case .subtraction:
            return "\(operand1 - operand2)"
        case .multiplication:
            return "\(operand1 * operand2)"
        case .division:
            return "\(operand1 / operand2)"
        }
    }
}
