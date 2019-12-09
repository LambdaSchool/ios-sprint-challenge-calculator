//
//  closures.swift
//  Calculator
//
//  Created by alfredo on 12/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class Closures{
    let applyOperation: (String, String, OperatorType?) -> String = {
        (op1, op2, op) in
        let operand1 = Double(op1)!
        let operand2 = Double(op2)!
        let result: Double!
        switch op{
        case .addition: result = operand1 + operand2
        case .subtraction: result = operand1 - operand2
        case .division: result = operand1 / operand2
        case .multiplication: result = operand1 * operand2
        default:
            return "Hey girl hey!"
        }
        return String(result)
    }
   let operand1AsFunctionX: (String, String, OperatorType?, Function?) -> Bool = { (operand1String, operand2String, operatorType, function) in
        guard operand2String == ""     else {return false}
        guard function != nil           else {return false}
        guard operand1String != ""      else {return false}
        guard operatorType == nil       else {return false}
        return true
    }
    let operatorHasBeenSelected: (OperatorType?) -> Bool = {
          (selectedOperator) in
          if let _ = selectedOperator{
              return true
          }
          return false
      }
    let lastButtonPressedWasOperatorButton: (ButtonType?) -> Bool = {
        (lastButtonPressed) in
        if let button = lastButtonPressed{
            return button == .operatorButton ? true : false
        }
        return false
    }
    let lastButtonPressedWasForOperand1: (ButtonType?) -> Bool = {
        (lastButtonPressed) in
        if let button = lastButtonPressed{
            return button == .operandButtonForOperand1 ? true : false
        }
        return false
    }
    let lastButtonPressedWasForOperand2: (ButtonType?) -> Bool = {
        (lastButtonPressed) in
        if let button = lastButtonPressed{
            return button == .operandButtonForOperand2 ? true : false
        }
        return false
    }
    let lastButtonPressedWasPercentageButton: (ButtonType?) -> Bool = {
        (lastButtonPressed) in
        if let button = lastButtonPressed{
            return button == .percentageButton ? true : false
        }
        return false
    }
    let lastButtonPressedWasDecimalButton: (ButtonType?) -> Bool = {
           (lastButtonPressed) in
           if let button = lastButtonPressed{
               return button == .decimalButton ? true : false
           }
           return false
       }
    let lastButtonPressedWasEqualButton: (ButtonType?) -> Bool = {
        (lastButtonPressed) in
        if let button = lastButtonPressed{
            return button == .equalButton ? true : false
        }
        return false
    }
    let selectedOperatorisEqualToOrLessThanPrecedenceOperator: (OperatorType?, OperatorType?) -> Bool = {
        (selectedOperator, precedenceOperator) in
        if let selectedOp = selectedOperator{
            if let precedenceOP = precedenceOperator{
                if selectedOp.precedence <= precedenceOP.precedence{
                    return true
                }
            }
        }
        return false
    }
    
}
