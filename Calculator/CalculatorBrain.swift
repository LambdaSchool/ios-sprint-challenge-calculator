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
        if operatorType == nil {
            if !(digit == "." && operand1String.contains(".")) {
                operand1String.append(digit)
            }
            return operand1String
        } else {
            if !(digit == "." && operand2String.contains(".")) {
                operand2String.append(digit)
            }
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        guard let operatorType : OperatorType = OperatorType(rawValue: operatorString) else {
            print("Unknown operator.")
            return
        }
        
        self.operatorType = operatorType
        operand2String = ""
    }
    
    func calculateIfPossible() -> String? {
        if operand1String == "" {
            return nil
        }
        if operand2String == "" {
            return nil
        }
        guard let op: OperatorType = operatorType else {
            return nil
        }
        
        guard let operand1 = Double(operand1String) else {
            print("Invalid operand1String")
            return nil
        }
        guard let operand2 = Double(operand2String) else {
            print("Invalid operand2String")
            return nil
        }
        
        let result: String
        
        switch op {
        case .addition:
            result = String(operand1 + operand2)
        case .subtraction:
            result = String(operand1 - operand2)
        case .multiplication:
            result = String(operand1 * operand2)
        case .division:
            if operand2 != 0 {
                result = String(operand1 / operand2)
            } else {
                result = "Error"
            }
        }
        
        return result
    }
    
    func negate(_ lastButtonPressWasEquals: Bool) -> String {
        let negatedNumber: String
        if operatorType == nil || lastButtonPressWasEquals {
            if operand1String.prefix(1) != "-" {
                operand1String = "-\(operand1String)"
            } else {
                operand1String = String((operand1String.dropFirst()))
            }
            negatedNumber = operand1String
        } else {
            if operand2String.prefix(1) != "-" {
                operand2String = "-\(operand2String)"
            } else {
                operand2String = String((operand2String.dropFirst()))
            }
            negatedNumber = operand2String
        }
        
        return negatedNumber
    }
    
    func percent(_ lastButtonPressWasEquals: Bool) -> String {
        let percent: String
        if operatorType == nil || lastButtonPressWasEquals {
            guard let operand1 = Double(operand1String) else {
                return ""
            }
            operand1String = String(operand1 / 100.0)
            percent = operand1String
        } else {
            guard let operand2 = Double(operand2String) else {
                return ""
            }
            operand2String = String(operand2 / 100.0)
            percent = operand2String
        }
        
        return percent
    }
}
