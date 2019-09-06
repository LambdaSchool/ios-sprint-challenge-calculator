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
    case division = "/"
    case multiplication = "*"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String.append(contentsOf: digit)
            return operand1String
        } else {
            operand2String.append(contentsOf: digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        if let opType = OperatorType(rawValue: operatorString) {
            operatorType = opType
        }
        
    }

    func calculateIfPossible() -> String? {
//        the answer will be a double , setting the answer variable of type default in the func
        guard let operand1 = Double(operand1String),
            let operand2 = Double(operand2String),
            let operatorType = operatorType else {return ""}
            var answer: Double
            switch operatorType {
            case .addition:
                answer = operand1 + operand2
            case .subtraction:
                answer = operand1 - operand2
            case .multiplication:
                answer = operand1 * operand2
            case .division:
                if  operand2 >= 1 {
                    answer = operand1 / operand2
                } else {
                return "error"
    }
        }
            return "\(answer)"
        
    }
}
