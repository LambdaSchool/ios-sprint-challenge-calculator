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
    var decimalPresent = false
    
    func addOperandDigit(_ digit: String) -> String {
        
        switch operatorType {
        case nil:
            if digit == "." {
                if decimalPresent == true {
                    return operand1String
                } else {
                    decimalPresent = true
                }
            }
            operand1String.append(digit)
            return operand1String
        default:
            if digit == "." {
                if decimalPresent == true {
                    return operand2String
                } else {
                    decimalPresent = true
                }
            }
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
        decimalPresent = false
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "" && operand2String != "" && operatorType != nil {
            let operand1 = Double(operand1String) ?? 0
            let operand2 = Double(operand2String) ?? 0
            
            switch operatorType {
            case .addition:
                let value = round((operand1 + operand2)*100000000)/100000000 //rounded to the 8th decimal
                if value.rounded() == value {
                    return String(Int(value))
                }
                return String(value)
            case .subtraction:
                let value = round((operand1 - operand2)*100000000)/100000000
                if value.rounded() == value {
                    return String(Int(value))
                }
                return String(value)
            case .multiplication:
                let value = round((operand1 * operand2)*100000000)/100000000
                if value.rounded() == value {
                    return String(Int(value))
                }
                return String(value)
            case .division:
                if operand2 == 0 {
                    return "Error"
                }
                let value = round((operand1 / operand2)*100000000)/100000000
                if value.rounded() == value {
                    return String(Int(value))
                }
                return String(value)
            default:
                return ""
            }
        }
        return nil
    }
}
