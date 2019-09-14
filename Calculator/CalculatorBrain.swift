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
    var numberString = ""
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType == nil{
            numberString = ""
            operand1String += digit
            numberString = operand1String
        } else {
            numberString = ""
            operand2String += digit
            numberString = operand2String
        }
    
        return numberString
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
        var calculation: Double
        guard let opType = operatorType else {
            return "nil"
        }
        guard let num1 = Double(operand1String), let num2 = Double(operand2String) else{
            return "nil"
        }
        
        switch opType.rawValue{
        case "+" :
            calculation = num1 + num2
        case "-" :
            calculation = num1 - num2
        case "*" :
            calculation = num1 * num2
        case "/" :
            calculation = num1 / num2
        default:
            return "error"
        }
        
        let calculationString = String(calculation)
        return calculationString
    }
}
