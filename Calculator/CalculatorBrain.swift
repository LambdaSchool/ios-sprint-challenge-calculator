//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    // Add operators
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
            operand1String.append(contentsOf: digit)
            return operand1String
        } else {
            operand2String.append(contentsOf: digit)
            return operand2String
        }
    
    }
    
    func setOperator(_ operatorString: String) {
        // instance of OperatorType enum
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        var returnValue: String?
        
        if operand1String == "" || operand2String == "" {
            returnValue = "0"
        }
        
        
        guard let value1 = Double(operand1String) else { return nil }
        guard let value2 = Double(operand2String) else { return nil }
        
        if let operatorType = operatorType {
            switch operatorType {
            case .addition:
                returnValue = "\(value1 + value2)"
            case .subtraction:
                returnValue = "\(value1 - value2)"
            case .multiplication:
                returnValue = "\(value1 * value2)"
            case .division:
                returnValue = "\(value1 / value2)"
            }
        }
        
        if returnValue == nil {
            returnValue = "0"
        }
        return returnValue
    }
}
