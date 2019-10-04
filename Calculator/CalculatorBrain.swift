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
    case multiplicaiton = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        var operand1 = operand1String
        var operand2 = operand2String
        
        if operand1 == "." {
        return operand1
        } else if operand2 == "." {
            return operand2
        }
        
        if operatorType == nil {
                operand1String.append(digit)
            return operand1String
            }
        else {
                operand2String.append(digit)
            return operand2String
            }
        }
    

    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        guard let number1 = Double(operand1String) else { return nil }
        guard let number2 = Double(operand2String) else { return nil }
        
        guard let operatorValue = operatorType else { return nil }
        
        var answer: Double
        
        switch operatorValue {
        case .addition:
            answer = number1 + number2
            return String(answer)
        case .subtraction:
            answer = number1 - number2
            return String(answer)
        case .multiplicaiton:
            answer = number1 * number2
            return String(answer)
        case .division:
            if number2 == 0 {
                return "Error"
            }
            answer = number1 / number2
            return String(answer)
        }

    }



}


// ask question about why
