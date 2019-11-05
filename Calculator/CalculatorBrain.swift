//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String
    {
        if let _ = operatorType
        {
            operand1String += digit
            return operand1String
        }
        else
        {
            operand2String += digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String)
    {
        if let type = OperatorType(rawValue: operatorString)
        {
            self.operatorType = type
        }
    }
    
    func calculateIfPossible() -> String? {
        if !operand1String.isEmpty,
            !operand2String.isEmpty,
        let type = operatorType,
        let operand1 = Double(operand1String),
        let operand2 = Double(operand2String)
        {
            switch type {
            case .add:
                return String(operand1 + operand2)
            case .subtract:
                return String(operand1 - operand2)
            case .multiply:
                return String(operand1 * operand2)
            case .divide:
                if operand2 != 0
                {
                    return String(operand1 / operand2)
                }
                else
                {
                    return "Cannot calculate"
                }
                
            }
        }
        
        return nil
    }
}
