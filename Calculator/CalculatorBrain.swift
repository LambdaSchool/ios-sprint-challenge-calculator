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
        if let opType = OperatorType(rawValue: operatorString) {
        operatorType = opType 
        }
    }
    
    func calculateIfPossible() -> String? {
        if !operand1String.isEmpty,
            !operand2String.isEmpty,
            let type = operatorType,
            let operand1 = Double(operand1String),
            let operand2 = Double(operand2String){
            switch type {
            case .multiplication :
                return String(operand1 * operand2)
            case .addition :
                return String(operand1 + operand2)
            case .subtraction :
                return String(operand1 - operand2)
            case .division :
                return String(operand1 / operand2)
            }
           
        }
         return nil
}
}
