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
        switch(operatorType){
        case .addition:
            operand2String.append(digit)
        case .subtraction:
            operand2String.append(digit)
        case .multiplication:
            operand2String.append(digit)
        case .division:
            operand2String.append(digit)
        default:
            operand1String.append(digit)
        }
        return operand2String
        
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        var result: String
        if operand1String != nil && operand2String != nil {
            if operatorType != nil {
                var num1 = Double(operand1String)
                var num2 = Double(operand2String)
                switch(operatorType) {
                case .addition:
                    result = num1 + num2
                case .subtraction:
                    result = num1 - num2
                case .division:
                    if let num2 == "0" {
                        print("Error")
                    } else {
                    result = num1 / num2
                    }
                case .multiplication:
                    result = num1 * num2
                    
                }
            }
            
        }
        return result
    } 
}
