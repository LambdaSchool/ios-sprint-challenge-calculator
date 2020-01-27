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
/* created other cases in the enum that's needed for the calcualtor. had to use the storyboard's calculator's operator texts 
to make the calculator fully functional, so I copied and pasted from that into the rawValues' strings.
*/

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    
/* creates empty variables, just waiting for instances to be created!
    */
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType != nil {
            operand1String.append(digit)
            return operand1String
        } else {
            operand2String.append(digit)
            return operand2String
        }
    }
 /* //this in thruth was me trying random things until something worked. the instructions were a little unlcear for me. 
    I saw append, "if the user has entered an operator already", and "which operand the passed-in digit belongs to" and 
    tried stuff. i will need to go over this one with someone.   
    */
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    // makes an instance (is that the right word?) of the enumerator.
    
    func calculateIfPossible() -> String? {
        if operand1String.isEmpty, operand2String.isEmpty, operatorType == nil {
            return "0"
            // this is saying if nothing has been entered, the default value in the output screen will say 0 until it's changed.
        } else {
            var calculatedAnswer: String
            if let num1 = Double(operand1String), let num2 = Double(operand2String) {
                // type-casting is done here to convert the strings into doubles.
                guard operatorType != nil else {
                    print("0")
                    return "0"
                }
                switch operatorType {
                case .addition?:
                    calculatedAnswer = String(num1 + num2)
                case .subtraction?:
                    calculatedAnswer = String(num2 - num1)
                case .multiplication?:
                    calculatedAnswer = String(num1 * num2)
                case .division?:
                    calculatedAnswer = String(num2 / num1)
                    
                default:
                    
                    return nil } } else {
                return nil
            }
            
           /* I love switch statements. they just look so clean. they're my favorite thing! so that was fun lol. 
            but yeah, this is basically saying, "if user hit this("this" being one of the enums), perform this math. 
            the code stops running until the used one is found and then performs the arithmetic given. 
            I assigned the operand1&2Strings to num1&num2 so I could convert them into Doubles. 
            */
            
            operand1String = calculatedAnswer
            operand2String = ""
            return calculatedAnswer
          
        }
    }
    func clear() {
        operand1String = ""
        operand2String = ""
        operatorType = nil
    }
}
// this makes it default back to 0 on the screen
