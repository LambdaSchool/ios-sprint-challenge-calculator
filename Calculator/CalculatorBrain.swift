//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

// MARK: - Enum

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

// MARK: - Class

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    init(operand1String: String, operand2String: String) {
        self.operand1String = operand1String
        self.operand2String = operand2String
        self.operatorType = nil
    }
    
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String = operand1String + digit
            return operand1String
        } else {
            operand2String = operand2String + digit
            return operand2String
        }
        
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+":
            operatorType = OperatorType.addition
        case "−":
            operatorType = OperatorType.subtraction
        case "×":
            operatorType = OperatorType.multiplication
        case "÷":
            operatorType = OperatorType.division
        default:
            operatorType = nil
        }
        print("\(String(describing: operatorType))")
    }

    func calculateIfPossible() -> String? {
        guard let operand1 = Double(operand1String) else { return nil }
        guard let operand2 = Double(operand2String) else { return nil } // Unwrap operand1String/2 and turn it to a Double if not nil
        guard let operatorType = operatorType else { return nil } //
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
