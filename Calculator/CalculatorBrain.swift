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
            // no operator type, add to operand1String
            operand1String.append(digit)
            return operand1String
        } else {
            // operator type is initialized, add to operand2String
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        switch(operatorString) {
            case "+":
                operatorType = .addition
            case "-":
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
        guard let op1 = Double(operand1String) else { return nil }
        guard let op2 = Double(operand2String) else { return nil }
        guard let opType = operatorType else { return nil }
        
        if op1.isZero && opType == .division {
            return "Error"
        }
        
        switch opType {
            case .addition:
                return "\(op1 + op2)"
            case .subtraction:
                return "\(op1 - op2)"
            case .multiplication:
                return "\(op1 * op2)"
            case .division:
                return "\(op1 / op2)"
        }
    }
}
