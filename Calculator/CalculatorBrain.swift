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
        guard operatorType != nil else {
            operand1String.append(digit)
            return operand1String
        }
        operand2String.append(digit)
        return operand2String
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        if operand1String == "" && operand2String == "" {
            return nil
        }
        
        guard let unwrappedOperatorType = operatorType else {
            return nil
        }
        
        guard let doubleOperand1 = Double(operand1String), let doubleOperand2 = Double(operand2String) else {
            return nil
        }
        
        switch unwrappedOperatorType {
        case .addition:
            return String(doubleOperand1 + doubleOperand2)
        case .subtraction:
            return String(doubleOperand1 - doubleOperand2)
        case .multiplication:
            return String(doubleOperand1 * doubleOperand2)
        case .division:
            if doubleOperand2 == 0.0 {
                return "Error"
            }
            return String(doubleOperand1 / doubleOperand2)
        }
    }
}
