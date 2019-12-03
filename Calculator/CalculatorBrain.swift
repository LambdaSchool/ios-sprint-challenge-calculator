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
    case multiplication = "x"
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
        if let opType = OperatorType(rawValue:operatorString) {
            operatorType = opType
        }
    }
    
    func calculateIfPossible() -> String? {
        if let operandType = operatorType,!operand1String.isEmpty,!operand2String.isEmpty,let operand1 = Double(operand1String),let operand2 = Double(operand2String){
            switch operandType {
            case.addition:
                return String(operand1 + operand2)
            case .subtraction:
                return String(operand1 - operand2)
            case .multiplication:
                return String(operand1 * operand2)
            case .division:
                if operand2 == 0 {
                    return "Error"
                } else {
                    return String(operand1 / operand2)
                }
                
            }
        }
        return nil
    }
}

        
            
