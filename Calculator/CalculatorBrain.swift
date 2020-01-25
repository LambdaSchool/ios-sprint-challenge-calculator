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
        if let mathOperator = operatorType {
            operand1String.append(digit)
            return operand1String
        } else {
            operand2String.append(digit)
            return operand2String
        }
        
        
    }
    
    func setOperator(_ operatorString: String) {
        if let sign = OperatorType(rawValue: operatorString) {
            operatorType = sign
            
        }
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "", operand2String != "" {
            guard let operatorType = operatorType, let num1 = Double(operand1String), let num2 = Double(operand2String) else { return "Error" }
            switch(operatorType){
            case .addition:
                return String(num1+num2)
            case .subtraction:
                return String(round((num2-num1)*10)/10)
            case .multiplication:
                return String(num1*num2)
            case .division:
                if num1 == 0 {
                    return "Error"
                } else {
                    
                    return String(num2/num1)
                }
            }
        }
        return nil
    }
    
}








