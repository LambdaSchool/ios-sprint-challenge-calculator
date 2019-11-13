// GET FUNKY WITH IT!
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
/* Above the class, look for the enum called `OperatorType`. It will help you decide which type of calculation to perform. One case is already created for you, but you'll need to add the other three: `subtraction`, `multiplication`, and `division`. Notice the raw value type of the enum is `String`, which means each case can have a separate value that is a `String`. Go look at the operator buttons in the storyboard. Notice they use different symbols from `+, -, *, /`. Copy the following symbols from this document for addition, subtraction, multiplication, and division: `+, −, ×, ÷`. Place them after each corresponding case (use the addition case as a model). This mapping of case to symbol will let you determine what operation the user wants to perform from the symbol string on the button. */
enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    /* Inside the `CalculatorBrain` class, take a look at the 3 properties already declared for you. The first two will hold the values of the operands (so for example, the `2` and the `4` in `2 + 4`). The last property holds an instance of `OperatorType` and represents the kind of operation you'll be calculating (addition, subtraction, multiplication, or division). */
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    // add case for if operator is nil and (operand1 & operand2) exists to clear operand2 and start placing operand in operand1
    func addOperandDigit(_ digit: String) -> String {
    /* In `addOperandDigit`, you have to figure out first which operand the passed-in digit belongs to. */
        /* If the user has entered an operator already...*/
        if let _ = operatorType {
            /* CONTINUED: the `operatorType` you defined above will have a value. Use the presence or absence of an operator to decide where this `digit` belongs.*/
            operand2String.append(digit)
            return operand2String
        }
        /* Append the digit string to the end of either `operand1String` or `operand2String`*/
        operand1String.append(digit)
        /* Return that string to the caller of this method. */
        return operand1String
        
    }
    
    func setOperator(_ operatorString: String) {
        /* In `setOperator`, convert the `operatorString` passed into this method into an instance of your `OperatorType` enum, */
        if let selectedOperator: OperatorType = OperatorType(rawValue: operatorString) {
            /* and then assign it to your `operatorType` property. */
            operatorType = selectedOperator
        }
    }
    /*  Strech Goal: Truncating decimal and trailing zeros: if the solution to the arithmetic expression is an integer, the display should not show the decimal point or any trailing zeros (1 + 2 = 3 rather than 3.0).*/
    func formatNumber(double: Double) -> String{
        let roundedDouble = double.rounded(.towardZero)
        if (double - roundedDouble) != 0{
            return String(double)
        }
        return String(Int(double))
    }
    /* In `calculateIfPossible`, hopefully you can calculate an answer based on the data you've stored so far in the brain.*/
    func calculateIfPossible() -> String? {
        /* Start by checking that the two operand strings are not empty, as `""` wouldn't turn into a valid number. Then, check that the `operatorType` variable isn't nil, since you need a valid operator to perform the arithmetic.*/
        /* Convert the two operand strings into `Double`s. */
        guard let operand1Double = Double(operand1String) else { return nil }
        guard let operand2Double = Double(operand2String) else { return nil }
        guard let selectedOperator = operatorType else { return nil }
        /* With all that setup done, use the type you found in step 2 to decide which kind of arithmetic you'll perform on the operands. Since you have several possible codepaths and only want to execute one of them at runtime, a `switch` is likely a good choice here. 😉 */
        switch selectedOperator {
            /* For each kind of arithmetic, use your two operand `Double`s to perform either addition, subtraction, multiplication, or division (remember you can't divide-by-zero, so make sure to check for that before actually doing the math to avoid the app crashing. If you do encounter that, simply return `"Error"` for your answer).*/
            /* Whatever your result is from the above arithmetic, return the answer as a `String`.*/
            case .addition:
               let finalAnswerDouble = operand1Double + operand2Double
               return formatNumber(double: finalAnswerDouble)
            case .subtraction:
               let finalAnswerDouble = operand1Double - operand2Double
               return formatNumber(double: finalAnswerDouble)
            case .multiplication:
               let finalAnswerDouble = operand1Double * operand2Double
               return formatNumber(double: finalAnswerDouble)
            case .division:
                /* avoid dividing by zero*/
                if operand2Double != 0 {
                    let finalAnswerDouble = operand1Double / operand2Double
                    return formatNumber(double: finalAnswerDouble)
               } else {
                    return "Error"
               }
        }
    }
}
