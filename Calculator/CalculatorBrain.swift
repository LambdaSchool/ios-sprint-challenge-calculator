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
        if let _ = operatorType {
            operand2String += digit
            return operand2String
        } else {
            operand1String += digit
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        if let operatorType = OperatorType(rawValue: operatorString) {
            self.operatorType = operatorType
        }
    }
    
    func calculateIfPossible() -> String? {
        if !operand1String.isEmpty, !operand2String.isEmpty, let opType = operatorType, let op1 = Double(operand1String), let op2 = Double(operand2String) {
            
            switch opType {
            case .addition:
                return String(op1 + op2)
            case .subtraction:
                return String(op1 - op2)
            case .multiplication:
                return String(op1 * op2)
            case .division:
                if op2 != 0 {
                    return String(op1 / op2)
                } else {
                    return "Error!"
                }
            }
            
        }
        return nil
    }
}
