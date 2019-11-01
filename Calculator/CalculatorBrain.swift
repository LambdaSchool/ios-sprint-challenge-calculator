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
            if digit != "." || !operand1String.contains(".") {
                operand1String += digit
            }
            return operand1String
            
        } else {
            if digit != "." || !operand2String.contains(".") {
                operand2String += digit
            }
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
        if operand1String.isEmpty {
            operand1String = "0"
        }
        
        operatorType = OperatorType(rawValue: operatorString)
        
    }
    
    func calculateIfPossible() -> String? {
        if operand1String.isEmpty || operand2String.isEmpty { return nil}
        if operatorType == nil { return nil }
        
        guard let operand1: Double = Double(operand1String) else { return nil }
        guard let operand2: Double = Double(operand2String) else { return nil }
        
        let solution: Double
        
        switch operatorType {
        case .addition:
            solution = operand1 + operand2
        case .subtraction:
            solution = operand1 - operand2
        case .multiplication:
            solution = operand1 * operand2
        case .division:
            if operand2 == 0 { return nil}
            solution = operand1 / operand2
        default:
            return nil
        }
        let solutionString: String
        if floor(solution) == solution {
            solutionString = "\(Int(solution))"
        } else {
            solutionString = "\(solution)"
        }
        
        return solutionString
    }
}
