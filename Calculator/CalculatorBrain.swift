//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//


//Note to the teacher reviewing. I did not finish any stretch goals YET. I plan on getting them done and continuouslly updating this app as I go with the funcitonality of my other Calculator on my github repo!



import Foundation


//here we are creating the enum for different operator types. this way we can easily access them through the enum type. 
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
    
            //1 this is asking if the operand 1 & 2 are not empty. as well as if the operator type is nil. if so, return 0. If not. then continue to the else statment.
       //2 this is creating a variable acalled calculatedAnswer which is of type String. this is so we can assign the answer to this value and return it within the function.
    //3 create a constant called num1 and num2 that are of type Double casted operandString 1 & 2 respectively. if so, then continue to the switch statement.
    //4 the switch statement here is checking the operator type that has been chosen. And using the numbers assigned to do the respective calculations for the different buttons.
    
    func calculateIfPossible() -> String? {
        //1
        if operand1String.isEmpty, operand2String.isEmpty, operatorType == nil {
            return "0"
        } else {
            //2
            var calculatedAnswer: String
            //3
            if let num1 = Double(operand1String), let num2 = Double(operand2String) {
                //4
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
            } //5
            operand1String = calculatedAnswer
            operand2String = ""
            return calculatedAnswer
        }
    }
}


