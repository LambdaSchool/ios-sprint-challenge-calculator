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
    case multiplication = "*"
    case division = "/"
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
        if let operandType = OperatorType(rawValue: operatorString) {
            operatorType = operandType
        }
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "",
            operand2String != "",
            let type = operatorType,
            let operand1 = Double(operand1String),
            let operand2 = Double(operand2String) {
            
            switch type {
            case .addition:
                return ("\(operand1 + operand2)")
            case .subtraction:
                return ("\(operand1 - operand2)")
            case .multiplication:
                return ("\(operand1 * operand2)")
            case .division:
                return ("\(operand1 / operand2)")
            }
        }
        return " "
    }
    

}
