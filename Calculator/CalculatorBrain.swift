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
    case multiplication = "*"
    case division = "/"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    init() {
        self.operatorType = nil
    }
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String += digit
            return(operand1String)
        } else {
            operand2String += digit
            return(operand2String)
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "" && operand2String != "" {
            guard let unwrappedOperator = operatorType else { return "Missing operator" }
            guard let opera1 = Double(operand1String) else { return "Missing Operand 1" }
            guard let opera2 = Double(operand2String) else { return "Missing operand 2" }
       
            switch unwrappedOperator {
            case .addition:
                return String(opera1 + opera2)
            case .division:
                if opera2 == 0 { return "Not possible to divide by zero"}
                else { return String(opera1 / opera2) }
            case .multiplication:
                return String(opera1 * opera2)
            case .subtraction:
                return String(opera1 - opera2)
            }
        
        }
        return nil
    }
}

//
//Stretch Problems (Optional)
//
//After finishing your required elements, you can push your work further. These goals may or may not be things you have learned in this module but they build on the material you just studied. Time allowing, stretch your limits and see if you can deliver on the following optional goals:
//
//Preventing multiple decimal points: operands should only allow a single decimal point to be entered. If the decimal button is tapped more than once per operand, the subsequent taps should be ignored.
//Truncating decimal and trailing zeros: if the solution to the arithmetic expression is an integer, the display should not show the decimal point or any trailing zeros (1 + 2 = 3 rather than 3.0).
//Implement +/- button: when tapped, the button should toggle positive/negative for the current operand.
//Implement % button: when tapped, the current operand should have its decimal place moved 2 spaces to the left (50 becomes 0.5).



//For each kind of arithmetic, use your two operand Doubles to perform either addition, subtraction, multiplication, or division (remember you can't divide-by-zero, so make sure to check for that before actually doing the math to avoid the app crashing. If you do encounter that, simply return "Error" for your answer).
//Whatever your result is from the above arithmetic, return the answer as a String.
//If you can't do the calculation because you're missing some piece of data, return nil.


//In CalculatorBrain.swift:
//
//Above the class, look for the enum called OperatorType. It will help you decide which type of calculation to perform. One case is already created for you, but you'll need to add the other three: subtraction, multiplication, and division. Notice the raw value type of the enum is String, which means each case can have a separate value that is a String.
//Go look at the operator buttons in the storyboard. Notice they use different symbols from +, -, *, /. Copy the following symbols from this document for addition, subtraction, multiplication, and division: +, −, ×, ÷. Place them after each corresponding case (use the addition case as a model). This mapping of case to symbol will let you determine what operation the user wants to perform from the symbol string on the button. ===????
//Inside the CalculatorBrain class, take a look at the 3 properties already declared for you. The first two will hold the values of the operands (so for example, the 2 and the 4 in 2 + 4). The last property holds an instance of OperatorType and represents the kind of operation you'll be calculating (addition, subtraction, multiplication, or division).== nont do anything
//In addOperandDigit, you have to figure out first which operand the passed-in digit belongs to. If the user has entered an operator already, the operatorType you defined above will have a value. Use the presence or absence of an operator to decide where this digit belongs. Append the digit string to the end of either operand1String or operand2String and then return that string to the caller of this method.
