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
        if operatorType == nil {
            operatorType = OperatorType(rawValue: operatorString)
        }
    }
        
        func calculateIfPossible() -> String? {
            if let operatorType = operatorType {
                if operand2String.isEmpty {
                    operand2String = operand1String
                }
                
                guard let firstNum = Double(operand1String),
                    let secondNum = Double(operand2String) else { return nil }
                
                var answer: String
                
                switch operatorType {
                case .addition:
                    answer = "\(firstNum + secondNum)"
                case .subtraction:
                    answer = "\(firstNum - secondNum)"
                case .multiplication:
                    answer = "\(firstNum * secondNum)"
                case .division:
                    answer = "\(firstNum / secondNum)"
                    }
                
                return answer
                }
            return nil
            }
}
