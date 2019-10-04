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
        
            operand2String = appendOperandString(digit, operand2String)
            
            return(operand2String)
        } else {

            operand1String = appendOperandString(digit, operand1String)
            
            return(operand1String)
        }
    }
    
    func setOperator(_ operatorString: String) {
        // Check to see if the first operand is empty. Do not set operator if so
        if (operand1String.isEmpty) {
            //print("no number first")
            return
        }
        
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
                    calculateString = calculateToString(operand1, operand2, .addition)
                case .division:
                    if(operand1 == 0 || operand2 == 0 ) {
                        return "Error"
                    }
                    calculateString = calculateToString(operand1, operand2, .division)
                case .multiplication:
                    calculateString = calculateToString(operand1, operand2, .multiplication)
                case .subtraction:
                    calculateString = calculateToString(operand1, operand2, .subtraction)
                //default:
                    //return nil
                }
            }
        }
        // will return nil since set above
        return calculateString
    }
    
    func appendOperandString(_ digit: String, _ operandString: String) -> String
    {
        // Check for the decimals
        if (digit == "." && !decimalPressed) {
            decimalPressed = true
            let operand = operandString + digit
            return operand
        }
        
        if(digit == "." && decimalPressed) {
            return(operandString)
        } else {
            let operand = operandString + digit
            return operand
        }
    }
    
    // Checks the calculated operands and determines wheter to pring in a Double or Int
    func calculateToString(_ operand1: Double, _ operand2: Double, _ operatorType: OperatorType) -> String {
        var calculate: Double
        
        switch operatorType {
        case .addition :
            calculate = operand1 + operand2
        case .division:
            calculate = operand1 / operand2
        case .multiplication:
            calculate = operand1 * operand2
        case .subtraction:
            calculate = operand1 - operand2
        }
        
        if (floor(calculate) == calculate) {
            //print("isInt")
            return(String(Int(calculate)))
        } else {
            return(String(calculate))
        }
    }
}
