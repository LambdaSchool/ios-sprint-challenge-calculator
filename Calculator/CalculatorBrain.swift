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
    
    // TODO: check displayed value instead of current operand value
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
        // treat 0 as operand1 if operator pressed without previous input
        if operand1String.isEmpty {
            operand1String = "0"
        }
        
        operatorType = OperatorType(rawValue: operatorString) // oh wow, this is way easier than the way I had been doing it setting up a separate dictionary >_<
    }
    
    func toggleNegative() -> String {
        if operatorType == nil {
            if operand1String.first == "-" {
                operand1String.removeFirst()
            } else {
                operand1String = "-\(operand1String)"
            }
            return operand1String
        } else {
            if operand2String.first == "-" {
                operand2String.removeFirst()
            } else {
                operand2String = "-\(operand2String)"
            }
            return operand2String
        }
    }
    
    func operandToPercent(_ valueString: String) -> String {
        guard let value: Double = Double(valueString) else {
            return "ERROR"
        }
        
        let valuePercent = value * 0.01
        let valuePercentString = "\(valuePercent)"
        
        if operatorType == nil {
            operand1String = valuePercentString
        } else {
            operand2String = valuePercentString
        }
        
        return valuePercentString
    }
    
    func calculateIfPossible() -> String? {
        if operand1String.isEmpty || operand2String.isEmpty { return nil }
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
            if operand2 == 0 { return nil }
            solution = operand1 / operand2
        default:
            return nil
        }
        
        // display integer solution as integer
        let solutionText: String
        if floor(solution) == solution {
            solutionText = "\(Int(solution))"
        } else {
            solutionText = "\(solution)"
        }
        
        operand1String = solutionText // use solution as operand1 for next operator press
        operand2String = ""
        
        return solutionText
    }
}
