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
            if digit == ".", operand1String.contains(".") {
                return operand1String
            }
            operand1String.append(digit)
            return operand1String
        } else {
            if digit == ".", operand2String.contains(".") {
                return operand2String
            }
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        guard operand1String != "", operand2String != "" else { return nil }
        guard operatorType != nil else { return nil }
        
        if let operand1 = Double(operand1String),
            let operand2 = Double(operand2String) {
            switch operatorType! {
            case .addition:
                return String(operand1 + operand2)
            case .subtraction:
                return String(operand1 - operand2)
            case .multiplication:
                return String(operand1 * operand2)
            case .division:
                guard operand2 != 0 else { return "Error" }
                return String(operand1 / operand2)
            }
        }
        return nil
    }
    
}
