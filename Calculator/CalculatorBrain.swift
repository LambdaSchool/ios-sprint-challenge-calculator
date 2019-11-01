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
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Instance Methods
    /// Function to combined the numbers tapped into a value for calculation
    func addOperandDigit(_ digit: String) -> String {
        if operatorType != nil {
            operand2String += digit
            return operand2String
        } else {
            operand1String += digit
            return operand1String
        }
    }
    
    /// Function to set the operator for the expression based on the operator key tapped
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
            break
        }
    }
    
    /// Function to calculate the operands using the operator supplied if possible
    func calculateIfPossible() -> String? {
        if !operand1String.isEmpty && !operand2String.isEmpty {
            if let sign = operatorType {
                guard let num1 = Double(operand1String), let num2 = Double(operand2String) else { return nil }
                switch sign {
                case .addition:
                    return "\(num1 + num2)"
                case .subtraction:
                    return "\(num1 - num2)"
                case .multiplication:
                    return "\(num1 * num2)"
                case .division:
                    if num2 == 0 {
                        return "Error"
                    } else {
                        return "\(num1 / num2)"
                    }
                }
            }
        }
        return nil
    }
}
