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
            return operand2String
        } else {
            operand1String += digit
            return operand1String
        }
    }

    func setOperator(_ operatorString: String) {
        if let type = OperatorType(rawValue: operatorString) {
            operatorType = type
        }
    }
    
    func calculateIfPossible() -> String? {
        
        
        guard let operand1 = Double(operand1String) else { return nil }
        guard let operand2 = Double(operand2String) else { return nil }
        guard let operatorType = operatorType else { return nil }

        switch  operatorType {
        case .addition :
            let math = operand1 + operand2
            return "\(math)"
            
        case .subtraction:
            let math = operand1 - operand2
            return "\(math)"
            
        case .multiplication:
            let math = operand1 * operand2
            return "\(math)"
            
        case .division:
            if operand1 == 0, operand2 == 0 {
                return "Error"
            } else {
                let math = operand1 / operand2
            return "\(math)"
            }
            

        }
    }
}
