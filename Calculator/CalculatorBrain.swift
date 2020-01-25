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
        if operatorType == nil {
            return operand1append(digit)
        } else {
            return operand2append(digit)
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        guard operand1String.count > 0,
              operand2String.count > 0,
              let operatr = operatorType,
              let operand1 = Double(operand1String),
              let operand2 = Double(operand2String)
            else { return nil }
        switch operatr {
        case .addition:
            return "\(operand1 + operand2)"
        case .subtraction:
            return "\(operand1 - operand2)"
        case .multiplication:
            return "\(operand1 * operand2)"
        case .division:
            guard operand2 != 0 else { return "Error" }
            return "\(operand1 / operand2)"
        }
    }

    func operand1append(_ digit: String) -> String {
        if digit == "." && operand1String.contains(".") {
            return operand1String
        } else {
            operand1String.append(digit)
            return operand1String
        }
    }

    func operand2append(_ digit: String) -> String {
        if digit == "." && operand2String.contains(".") {
            return operand2String
        } else {
            operand2String.append(digit)
            return operand2String
        }
    }
}
