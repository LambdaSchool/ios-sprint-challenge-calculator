//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

/*
 In CalculatorBrain.swift:
 
 Above the class, look for the enum called OperatorType. It will help you decide which type of calculation to perform. One case is already created for you, but you'll need to add the other three: subtraction, multiplication, and division. Notice the raw value type of the enum is String, which means each case can have a separate value that is a String. Go look at the operator buttons in the storyboard. Notice they use different symbols from +, -, *, /. Copy the following symbols from this document for addition, subtraction, multiplication, and division: +, −, ×, ÷. Place them after each corresponding case (use the addition case as a model). This mapping of case to symbol will let you determine what operation the user wants to perform from the symbol string on the button.
 Inside the CalculatorBrain class, take a look at the 3 properties already declared for you. The first two will hold the values of the operands (so for example, the 2 and the 4 in 2 + 4). The last property holds an instance of OperatorType and represents the kind of operation you'll be calculating (addition, subtraction, multiplication, or division).
 In addOperandDigit, you have to figure out first which operand the passed-in digit belongs to. If the user has entered an operator already, the operatorType you defined above will have a value. Use the presence or absence of an operator to decide where this digit belongs. Append the digit string to the end of either operand1String or operand2String and then return that string to the caller of this method.

 */


enum OperatorType: String {
    case addition = "+"
    case substraction = "-"
    case division = "÷"
    case multiplication = "×"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    
    /*
  In addOperandDigit, you have to figure out first which operand the passed-in digit belongs to. If the user has entered an operator already, the operatorType you defined above will have a value. Use the presence or absence of an operator to decide where this digit belongs. Append the digit string to the end of either operand1String or operand2String and then return that string to the caller of this method.
 */
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operand1String == "" {
            operand1String = digit
            return operand1String
        }
        else {
            operand2String = digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        
        if operand1String != "" {
            
        }
        
        
    }
    
    func calculateIfPossible() -> String? {
        return ""
        
    }
}
