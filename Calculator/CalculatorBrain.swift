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
    case percent = "%"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) {
        if operatorType == nil {
            operand1String.append(digit)
        } else {
            operand2String.append(digit)
        }
    }
    
    func setOperator(_ operatorString: String) {
        if let operatorSet = OperatorType(rawValue: operatorString) {
            operatorType = operatorSet
        
        }
            var operatorString = operatorType?.rawValue ?? ""
    }

    func calculateIfPossible() -> String? {
//        the answer will be a double , setting the answer variable of type default in the func
        guard let storedValue = Double(operand1String),
        let storedValue2 = Double(operand2String),
            let operatorType = operatorType else {
            return "Error"}
        
        var answer: Double
        
            switch operatorType {
            case .addition:
                answer = storedValue + storedValue2
                
            case .subtraction:
                answer = storedValue - storedValue2
                
            case .division:
                answer = storedValue / storedValue2
                
            case .multiplication:
                answer = storedValue * storedValue2
            default:
                return "error"
            }
            return "\(answer)"
    }
}
