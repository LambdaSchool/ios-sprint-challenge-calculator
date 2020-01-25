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
    case percent = "%"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType? = nil
    
    func addOperandDigit(_ digit: String) -> String {
        if operand1String != "" {
            operand2String = digit
            return operand2String
        } else {
            operand1String = digit
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
            return
        }
    }
    
    func calculateIfPossible() -> String? {
        if operand1String == ""
            || operand2String == "" ||
            operatorType == nil {
            return "0"        }
        let operand1 = Double.init(operand1String)
        let operand2 = Double.init(operand2String)
        var result: Double
        switch operatorType {
        case .addition:
            result = (operand1 ?? 0.0) + (operand2 ?? 0.0)
        case .subtraction:
            if operand2 != 0 {
                result = (operand1 ?? 0.0) - (operand2 ?? 0.0)
            } else { return "Error" }
        case .multiplication:
            result = (operand1 ?? 0.0) * (operand2 ?? 0.0)
        case .division:
            result = (operand1 ?? 0.0) / (operand2 ?? 0.0)
        default:
            return nil
        }
        operand1String = ""
        operand2String = ""
        operatorType = nil
        return "\(result)"
    }
}
