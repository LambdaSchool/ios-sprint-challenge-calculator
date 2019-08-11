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
    
    func addOperandDigit(_ digit: String)  {
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
        var answer: Double
        guard let storedValue = Double(operand1String) else {
            return "Error no number"}
        guard let storedValue2 = Double(operand2String) else {
            return "Error"}
        guard let operatorTypeOf = operatorType else{
            return "error"
        }; switch operatorTypeOf {
        case .addition:
       answer = storedValue + storedValue2
       return "\(answer)"

        case .subtraction:
           answer = storedValue - storedValue2
           return "\(answer)"

        case .division:
           answer = storedValue / storedValue2
           return "\(answer)"
            
        case .multiplication:
            answer = storedValue * storedValue2
            return "\(answer)"

        default:
            return "Error"
        }
    
    }

}

