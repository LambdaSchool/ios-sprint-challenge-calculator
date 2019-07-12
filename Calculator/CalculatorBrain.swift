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
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String += digit
            return operand1String
        }else{
            operand2String += digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+":
            operatorType = .addition
        case "-":
            operatorType = .subtraction
        case "×":
            operatorType = .multiplication
        case "÷":
            operatorType = .division
        default:
            return
        }
        print(operatorType?.rawValue)
    }
    
    func calculateIfPossible() -> String? {
        var result : Double
        if let operand1 = Double(operand1String), let operand2 = Double(operand2String),  let operatorType = self.operatorType{
            if operatorType == .division && operand2 == 0 {
                return "Error"
            }
            switch operatorType{
            case .addition:
                result = operand1 + operand2
            case .subtraction:
                result = operand1 - operand2
            case .multiplication:
                result = operand1 * operand2
            case .division:
                result = operand1 / operand2
            }
            return String(result)
        }
        return nil
    }
}
