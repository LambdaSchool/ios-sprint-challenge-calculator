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
        if let _ = operatorType {
            operand1String += digit
            return operand1String
        } else {
            operand2String += digit
            return operand2String
        }
        
        
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        if !operand1String.isEmpty,
            !operand2String.isEmpty,
            
            let operatorSelector = operatorType,
            let operand1 = Double(operand1String),
            let operand2 = Double(operand2String) {
            switch operatorSelector {
            case .addition:
                return String(operand1 + operand2)
            case .subtraction:
                return String(operand1 - operand2)
            case .multiplication:
                return String(operand1 * operand2)
            case .division:
                if operand2 != 0{
                    return String(operand1 / operand2)
                } else {
                    return "Cannot Calculate"
                }
               
            
            }
        }
        return nil
    }
}



//
//
//- In setOperator, convert the operatorString passed into this method into an instance of your OperatorType enum, and then assign it to your operatorType property.
//- In calculateIfPossible, hopefully you can calculate an answer based on the data you've stored so far in the brain.
//   1. Start by checking that the two operand strings are not empty, as "" wouldn't turn into a valid number.
//   2. Then, check that the operatorType variable isn't nil, since you need a valid operator to perform the arithmetic.
//   3. Convert the two operand strings into Doubles.
//   4. With all that setup done, use the type you found in step 2 to decide which kind of arithmetic you'll perform on the operands. Since you have several possible codepaths and only want to execute one of them at runtime, a switch is likely a good choice here. 😉
//   5. For each kind of arithmetic, use your two operand Doubles to perform either addition, subtraction, multiplication, or division (remember you can't divide-by-zero, so make sure to check for that before actually doing the math to avoid the app crashing. If you do encounter that, simply return "Error" for your answer).
//   6. Whatever your result is from the above arithmetic, return the answer as a String.
////   7. If you can't do the calculation because you're missing some piece of data, return nil.
