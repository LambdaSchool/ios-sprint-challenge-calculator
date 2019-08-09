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
        if operatorType != nil {
          operand2String.append(contentsOf: digit)
            return operand2String
        } else {
            operand1String.append(contentsOf: digit)
            return operand1String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
        let math = OperatorType(rawValue: operatorString)
        operatorType = math

    }
    
    func calculateIfPossible() -> String? {
        guard let calculate = operatorType,
            let firstNum = Double(operand1String),
            let secondNum = Double(operand2String) else { return }
        
        switch calculate {
        case OperatorType.addition:
        return String(firstNum + secondNum)
        case OperatorType.subtraction:
        return String(firstNum - secondNum)
        case OperatorType.multiplication:
        return String(firstNum * secondNum)
        case OperatorType.division:
        return String(firstNum / secondNum)
        default:
            break
        }
    }
}



