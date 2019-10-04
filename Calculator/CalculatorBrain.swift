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
    var decimalPressed = false
    
    func addOperandDigit(_ digit: String) -> String {
        
        if let _ = operatorType {
            
            if (digit == "." && decimalPressed == false) {
                decimalPressed = true
                operand2String += digit
            }
            
            if(decimalPressed && digit == ".") {
                return(operand2String)
            } else {
                operand2String += digit
            }
            return(operand2String)
        } else {
            
            if (digit == "." && decimalPressed == false) {
                decimalPressed = true
                operand1String += digit
            }
            
            if(decimalPressed && digit == ".") {
                return(operand1String)
            } else {
                operand1String += digit
            }
            return(operand1String)
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
        
        // resets the decimal pressed bool for the second operand string
        decimalPressed = false
    }
    
    func calculateIfPossible() -> String? {
        var calculateString: String? = nil
        
        if (!operand1String.isEmpty && !operand2String.isEmpty)
        {
            if let operatorType = operatorType {
                let operand1 = Double(operand1String) ?? 0
                let operand2 = Double(operand2String) ?? 0
                
                switch operatorType {
                case .addition :
                    calculateString = String(operand1 + operand2)
                case .division:
                    if(operand1 == 0 || operand2 == 0 ) {
                        return "Error"
                    }
                    calculateString = String(operand1 / operand2)
                case .multiplication:
                    calculateString = String(operand1 * operand2)
                case .subtraction:
                    calculateString = String(operand1 - operand2)
                //default:
                    //return nil
                }
            }
        }
        // will return nil since set above
        return calculateString
    }
    
    func checkMultipleDecimals(_ digit: String, _ operandString: String) -> String
    {
        if (digit == "." && decimalPressed == false) {
            decimalPressed = true
            let operand = operandString + digit
            return operand
        }
        return(operandString)
    }
}
