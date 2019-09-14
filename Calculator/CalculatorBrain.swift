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
    case multiplication = "*"
    case division = "/"
    
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        let textInput = "\(digit)"
        
        if operatorType == nil{
            operand1String = textInput
        } else {
            operand2String = textInput
        }
        return textInput
    }
    
    
    func setOperator(_ operatorString: String){
        
        switch operatorString{
        case "+":
            operatorType = OperatorType.addition
        case "−":
            operatorType = OperatorType.subtraction
        case "×":
            operatorType = OperatorType.multiplication
        case "÷":
            operatorType = OperatorType.division
        default:
            return
        }
        
        }

    
    func calculateIfPossible() -> String? {
        var intCalculation = Int(operand1String); +operatorType?.rawValue! + Int(operand2String)
        var calculation = String(intCalculation)
        return calculation
    }
}
