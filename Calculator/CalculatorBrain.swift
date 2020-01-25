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
            operand1String.append(contentsOf: digit)
            return operand1String
        } else {
            operand2String.append(contentsOf: digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {

        switch operatorString {
        case "+":
            operatorType = .addition
        case "−":
            operatorType = .subtraction
        case "×":
            operatorType = .multiplication
        case "÷":
            operatorType = .division
        default:
            operatorType = nil
        }
    }
    
    func calculateIfPossible() -> String? {
        
        if !operand1String.isEmpty,
            !operand2String.isEmpty,
            let unwrapped1Operand = Double(operand1String),
            let unwrapped2Operand = Double(operand2String),
            let unwrappedOperatorType = operatorType {
            
            switch unwrappedOperatorType {
            case .addition:
                let additionAnswer = unwrapped1Operand + unwrapped2Operand
                return String(additionAnswer)
            case .subtraction:
                let subtractionAnswer = unwrapped1Operand - unwrapped2Operand
                return String(subtractionAnswer)
            case .multiplication:
                let multiplicationAnswer = unwrapped1Operand * unwrapped1Operand
                return String(multiplicationAnswer)
            case .division:
                let divisionAnswer = unwrapped1Operand / unwrapped1Operand
                return String(divisionAnswer)
            }
            
        }
        
        
        return nil
    }
}
