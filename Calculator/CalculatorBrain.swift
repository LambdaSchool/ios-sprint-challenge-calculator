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
        if operatorType == nil {
            operand1String = operand1String + digit
            return operand1String
        } else {
            operand2String = operand2String + digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        let theOperator = OperatorType(rawValue: operatorString)
        operatorType = theOperator
    }
    
    func calculateIfPossible() -> String? {
        if operand1String == "" || operand2String == "" {
            return "0"
        }
        
        if operatorType == nil {
            return "0"
        }
        
        guard let double1 = Double(operand1String) else { return nil }
        guard let double2 = Double(operand2String) else { return nil }
        
    
        if let operatorType = operatorType {
            switch operatorType {
            case .addition:
                return "\(double1 + double2)"
            case .subtraction:
                return "\(double1 - double2)"
            case .division:
                return "\(double1 / double2)"
            case .multiplication:
                return "\(double1 * double2)"
                }
        }
    return nil
    }

}
