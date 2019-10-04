//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

// add the other three: subtraction, multiplication, and division
enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case mutiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        /* Use the presence or absence of an operator to decide where this digit belongs. Append the digit string to the end of either operand1String or operand2String and then return that string to the caller of this method. */
        // (Updated syntax based on Xcode error fix) --> was originally !operatorType
        
        if !(operatorType != nil) {
            operand1String.append(digit)
            return operand1String
        } else {
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
        operatorType = OperatorType(rawValue: operatorString)
    }

    func calculateIfPossible() -> String? {
        
        if !operand1String.isEmpty && !operand2String.isEmpty {
            
            guard let operatorType = operatorType else {return "Error"}
            guard let operand1Numbers = Double(operand1String), let operand2Numbers = Double(operand2String) else {return "Error"}
            
                switch operatorType {
                case .addition:
                    let added = operand1Numbers + operand2Numbers
                    return String(added)
                case .subtraction:
                    let subtracted = operand1Numbers - operand2Numbers
                    return String(subtracted)
                case .mutiplication:
                    let multiplied = operand1Numbers * operand2Numbers
                    return String(multiplied)
                case .division:
                    if operand2Numbers != 0 {
                        let divided = operand1Numbers / operand2Numbers
                        return String(divided)
                    } else {return "ERROR"}
                default:
                    return nil
                }
        }
        return "Error"
    }
}
