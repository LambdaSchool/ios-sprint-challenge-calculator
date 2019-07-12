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
    case multipication = "×"
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
        if let opType = OperatorType(rawValue: operatorString) {
            operatorType = opType
        }
    }
    
    
    func calculateIfPossible() -> String? {
        guard let operandDouble1 = Double(operand1String),
            let operandDouble2 = Double(operand2String),
            let operatorType = operatorType else { return nil }
        var solve: Double
        switch operatorType {
        case .addition:
            solve = operandDouble1 + operandDouble2
        case .subtraction:
            solve = operandDouble1 - operandDouble2
        case .multipication:
            solve =  operandDouble1 * operandDouble2
        case .division:
            solve = operandDouble1 / operandDouble2
            
        }
        return "\(solve)"
    }
}


