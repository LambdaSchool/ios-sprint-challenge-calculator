//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//  Casualty

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
        
        // Adds operand digit if nil
        if operatorType != nil {
            operand2String.append(digit)
            return operand2String
        } else {
            operand1String.append(digit)
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
        // Sets the operator to it's rawValue
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        
        // Calculation for .addition, .subtraction, .multiplication, . division
                // Checking to see if oprand1String or operand2String are empty
        if operand1String.isEmpty, operand2String.isEmpty, operatorType == nil {
            return "0"
        } else {
            var finalAnswer: String
            
            if let firstOperandNumber = Double(operand1String), let secondOperandNumber = Double(operand2String) {
                
                switch operatorType {
                case .addition? :
                    finalAnswer = String(firstOperandNumber + secondOperandNumber)
                case .subtraction? :
                    finalAnswer = String(firstOperandNumber - secondOperandNumber)
                case .multiplication? :
                    finalAnswer = String(firstOperandNumber * secondOperandNumber)
                case .division? :
                    if secondOperandNumber == 0 {
                        return "Nice try ;)"
                    } else {
                        finalAnswer = String(firstOperandNumber / secondOperandNumber)
                    }
                default :
                    return nil
                }
                
            } else {
                return nil
                
            }
            
            operand1String = finalAnswer
            operand2String = ""
            return finalAnswer
        }
    }
}
