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
    case division = "÷"
    case multiplication = "×"
    case subtraction = "−"
    
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        // This section only runs if an operatorType has not yet been tapped.
        if operatorType == nil {
            // Check for a second decimal attempt. If found, ignore it and return the string as it was.
            if operand1String.contains(".") && digit == "." {
                return operand1String
            } else {
            operand1String = operand1String + digit
            //   print("opOne \(operand1String)")   just used for runtime analysis
            return operand1String
            }
        }
        // This else section runs only if an operatorType has been tapped.
        else {
            // Check for a second decimal attempt. If found, ignore it and return the string as it was.
            if operand2String.contains(".") && digit == "." {
                return operand2String
            } else {
            operand2String = operand2String + digit
            //  print("opTwo \(operand2String)")    just used for runtime analysis
            return operand2String
            }
        }
    }
    // setOperator takes the symbol and uses the rawvalue in the enum to select the corresponding operator tapped by the user.
    func setOperator(_ operatorString: String) {
        self.operatorType = OperatorType(rawValue: operatorString)
    }
    
    // calculateIfPossible checks to make sure the operands can be converted to doubles. If not, error is return.
    // It uses a switch based on the operatortype and performs the corresponding math calculation.
    // The division checks for a divisor of 0 and returns an error if found.
    func calculateIfPossible() -> String? {
        guard let operand1 = Double(operand1String),
            let operand2 = Double(operand2String) else {
            return "error"
        }
        
        var answer: Double = 0
        if let opType = self.operatorType {
            switch opType {
            case .addition:
                answer = operand1 + operand2
            case .subtraction:
                answer = operand1 - operand2
            case .multiplication:
                answer = operand1 * operand2
            case .division:
                if operand2 == 0 {
                    return "error"
                } else {
                answer = operand1 / operand2
                }
            }
        }
        
        // Looks to see if the answer can be an integer and converts it to an Int if possible, otherwise it is left as a Double.
        if floor(answer) == answer {
            let returnedAnswer = Int(answer)
            return String(returnedAnswer)
        } else {
        return String(answer)
        }
    }
}
