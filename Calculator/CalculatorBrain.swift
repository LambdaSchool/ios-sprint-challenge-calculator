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
        if let operation = OperatorType(rawValue: operatorString) {
            operatorType = operation
        }
    }
    
    func calculateIfPossible() -> String? {
        if !operand1String.isEmpty, !operand2String.isEmpty,
        let operation = operatorType,
        let operand1 = Double(operand1String),
        let operand2 = Double(operand2String) {
            switch operation {
            case .addition:
                return removeDecimel(input: operand1 + operand2)
            case .subtraction:
                return removeDecimel(input: operand1 - operand2)
            case .multiplication:
                return removeDecimel(input: operand1 * operand2)
            case .division:
                if operand2 != 0 {
                    return removeDecimel(input: operand1 / operand2)
                } else {
                    return "Error"
                
                }
            }
        }
       return nil
    }
    func removeDecimel(input: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: input)) ?? ""
        
    
    }
    
}
