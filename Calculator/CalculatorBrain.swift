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
        
        var digitString: String = digit

        if operatorType != nil {
            operand2String.append(digitString)
            digitString = operand2String
        } else {
            operand1String.append(digitString)
            digitString = operand1String
        }
        
        
        return digitString
    }
    
    func setOperator(_ operatorString: String) {
        
        if operatorString == "+" {
            operatorType = .addition
            
        } else if operatorString == "-" {
            operatorType = .subtraction
            
        } else if operatorString == "×" {
            operatorType = .multiplication
        } else {
            operatorType = .division
        }
    }
    
    func calculateIfPossible() -> String? {
        
        if operand1String != "" && operand2String != "" {
            
            if let unwrappedOperatorType = operatorType {
                
                var doubleOperand1String: Double = 0
                var doubleOperand2String: Double = 0

                if let unwrapped1String = Double(operand1String) {
                    doubleOperand1String = unwrapped1String
                }
                
                if let unwrapped2String = Double(operand2String) {
                    doubleOperand2String = unwrapped2String
                }
                
                
                var value: Double
                
                switch unwrappedOperatorType {
                case .addition:
                    value = doubleOperand1String + doubleOperand1String
                case .division:
                    if doubleOperand2String == 0 {
                        return "Error"
                    } else {
                        value = doubleOperand1String / doubleOperand2String
                    }
                case .multiplication:
                    value = doubleOperand1String * doubleOperand2String
                case .subtraction:
                    value = doubleOperand1String - doubleOperand2String
                    
                }
                
                
                return String(value)
            }
            
        }
        
        
        
        return "test" // delete this later
    }
}
