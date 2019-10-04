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
        
        if let _ = operatorType {
            operand2String += digit
            return(operand2String)
        } else {
            operand1String += digit
            return(operand1String)
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        var calculateString: String?
        
        if (!operand1String.isEmpty && !operand2String.isEmpty)
        {
            if let operatorType = operatorType {
                let operand1 = Double(operand1String) ?? 0
                let operand2 = Double(operand2String) ?? 0
                
                switch operatorType {
                case .addition :
                    calculateString = String(operand1 + operand2)
                case .division:
                    calculateString = String(operand1 / operand2)
                case .multiplication:
                    calculateString = String(operand1 * operand2)
                case .subtraction:
                    calculateString = String(operand1 - operand2)
                //default:
                    //return nil
                }
            }
        }
        return calculateString
    }
}
