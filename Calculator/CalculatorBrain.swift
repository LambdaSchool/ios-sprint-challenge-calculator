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
            operand1String += digit
            return operand1String
        } else {
            operand2String += digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "", operand2String != "" {
        
            guard let operatorType = operatorType else { return nil }
            
            if let operand1Double = Double(operand1String), let operand2Double = Double(operand2String) {
                switch operatorType {
                case .addition:
                    let total = String(operand1Double + operand2Double)
                    return total
                case .subtraction:
                    return String(operand1Double - operand2Double)
                    
                case .multiplication:
                    return String(operand1Double * operand2Double)
                    
                case .division:
                    if operand2Double == 0 {
                        return "Error"
                    } else {
                        return String(operand1Double / operand2Double)
                    }
                }
            }
            
        }
        
        return "Error"
        
    }
}
