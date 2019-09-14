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
            operatorType = .addition
        case "−":
            operatorType = .subtraction
        case "×":
            operatorType = .multiplication
        case "÷":
            operatorType = .division
        default:
            return
        }
        
        }

    
    func calculateIfPossible() -> String? {
        var calculation: Double = 0.0
        guard let num1 = Double(operand1String), let num2 = Double(operand2String) else{
            return ""
        }
        
        switch operatorType?.rawValue{
        case "+" :
            calculation = num1 + num2
        case "-" :
            calculation = num1 - num2
        case "*" :
            calculation = num1 * num2
        case "/" :
            calculation = num1 / num2
        default:
            return ""
        }
        
        let calculationString = String(calculation)
        return calculationString
    }
}
