//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
//    adds the additional OperatorType 's to the case list enum, and uses the correct symbols
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
    
}

class CalculatorBrain {
//    sets the operands blank, and operatorType to optional of OperatorType
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    
    
    
    func addOperandDigit(_ digit: String) -> String {
//        verifies that if the operatorType was set to true (or has a value) then will set the next operand to the operand2String and increase it with each "digit" pressed
        if let operatorType = operatorType {
            operand2String += digit
            return operand2String
        } else {
//            else if no operatorType set, then will set the operand1String and increase it with each "digit" pressed
            operand1String += digit
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) -> String? {
//        displays the raw value of the operatorString from the button pressed, and sets to revceivedoperatorType, then passes it back to the "operatorType"
        if let receivedOperatorType = OperatorType(rawValue: operatorString) {
            operatorType = receivedOperatorType
            return operatorType?.rawValue
        }
        return nil
    }
    func calculateIfPossible() -> String? {
        
        
//        sets the operatorType to "opType", then verifies both operand1/2Strings have a value or return nil. Sets both new op1/2String's to the double of operand1/2String's. Creates a switch for each opType enum, and return their String from their respective equation. In the case of dividing by 0 it verifies the op2String is not 0 else returns "Error" first, then does the equation for a normal division.
        if let opType = operatorType,
            !operand1String.isEmpty,
            !operand2String.isEmpty,
            let op1String = Double(operand1String),
            let op2String = Double(operand2String) {
                switch opType {
                case.addition:
                    return String(op1String + op2String)
                case.subtraction:
                    return String(op1String - op2String)
                case.multiplication:
                    return String(op1String * op2String)
                case.division:
                    if op2String != 0 {
                        return String(op1String / op2String)
                    } else {
                        return "Error"
                    }
                }
            }
        return nil
        }
}
