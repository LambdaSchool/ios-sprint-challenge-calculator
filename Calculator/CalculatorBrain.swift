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
    case division = "÷"
    case multiplication = "×"
}


class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType == OperatorType(rawValue: "") {
            let digit = operand2String.append(digit)
        } else {
            let digit = operand1String.append(digit)
        }
        return String(digit)
    }

    func setOperator(_ operatorString: String) {
        var operatorString = OperatorType.RawValue.self
    }

    func calculateIfPossible() -> String? {
        if !operand1String.isEmpty, !operand2String.isEmpty, operatorType == nil {
            switch operatorType {
            case .addition:
                let result = Double(operand1String) + Double(operand2String)
            case .division:
                let result = Double(operand1String) / Double(operand1String)
            case .multiplication:
                let result = Double(operand1String) * Double(operand2String)
            case .subtraction:
                let result = Double(operand1String) - Double(operand2String)
            default:
                return "Error"
            }
            
            return String(result)
        }
    }
}
