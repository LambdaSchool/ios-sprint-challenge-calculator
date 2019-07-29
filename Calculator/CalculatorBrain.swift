//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//


//Note to the teacher reviewing. I did not finish any stretch goals YET. I plan on getting them done and continuouslly updating this app as I go with the funcitonality of my other Calculator on my github repo!



import Foundation



enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
    case percent = "%"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
   //this will ask if the operator type is nil. If not, it appends digits to it, and returns it to the method
    //i still dont get how it knows to ORDER these numbers I just kind of got it to work at this point with a lot of stack overflow
    func addOperandDigit(_ digit: String) -> String {
        if operatorType != nil {
            operand1String.append(digit)
            return operand1String
        } else {
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
       //this will give the opertaor type a raw value (so the title) of the string being cast in. which is of tyoe operator tupe.
        operatorType = OperatorType(rawValue: operatorString)
    }
    //this was ridiculously hard for me to call out with strings. i didnt really feel like i solodified the concepts very well and would like some support on some after hours or some targeted lessons
    func calculateIfPossible() -> String? {
        if operand1String.isEmpty, operand2String.isEmpty, operatorType == nil {
            return "0"
        } else {
            var calculatedAnswer: String
            
            if let num1 = Double(operand1String), let num2 = Double(operand2String) {
                
                switch operatorType {
                case .addition? :
                    calculatedAnswer = String(num1 + num2)
                case .subtraction? :
                    calculatedAnswer = String(num1 - num2)
                case .multiplication? :
                    calculatedAnswer = String(num1 * num2)
                case .division? :
                    calculatedAnswer = String(num1 / num2)
                default :
                    return nil}} else {
                return nil
            }
            operand1String = calculatedAnswer
            operand2String = ""
            return calculatedAnswer
        }
    }
}


