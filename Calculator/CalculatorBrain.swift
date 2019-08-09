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

class OutputDisplay {
    var text:String = "0"
    
    func clear () {
        self.text = "0"
    }
    
    func append (_ text: String) {
        if self.text == "0" {
            self.text = text
        } else {
            self.text += text
        }
    }
    
    func replace (_ text:String) {
        if self.text != "0" {
            self.text.remove(at: self.text.index(before: self.text.endIndex))
            self.text += text
        }
    }
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    var outputDisplay:OutputDisplay = OutputDisplay ()
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            if digit == "." {
                if !operand1String.contains(".") {
                operand1String += digit
                outputDisplay.append(digit)
                }
            } else {
                operand1String += digit
                outputDisplay.append(digit)
            }
        } else {
            if digit == "." {
                if !operand2String.contains(".") {
                    operand2String += digit
                    outputDisplay.append(digit)
                }
            } else {
                operand2String += digit
                outputDisplay.append(digit)
            }
        }
        return outputDisplay.text
    }
    
    func setOperator(_ operatorString: String) {
        if operatorType == nil {
            switch operatorString {
            case "+" :
                operatorType = .addition
                outputDisplay.append("+")
            case "−" :
                operatorType = .subtraction
                outputDisplay.append ("−")
            case "÷" :
                operatorType = .division
                outputDisplay.append("÷")
            case "×" :
                operatorType = .multiplication
                outputDisplay.append("×")
            default :
                break
            }
        }
    }
    
    func calculateIfPossible() -> String? {
        guard self.operand1String != "", self.operand2String != "", self.operatorType != nil else {
            return nil
        }
        var result:Double = 0.0
        let op:OperatorType = self.operatorType!
        guard let operand1 = Double(self.operand1String) else {return nil}
        guard let operand2 = Double(self.operand2String) else {return nil}
        switch op {
        case .addition :
            result = operand1 + operand2
            break
        case .subtraction :
            result = operand1 - operand2
            break
        case .division :
            if operand2 == 0.0 {return nil}
            result = operand1 / operand2
            break
        case .multiplication :
            result = operand1 * operand2
            break
        }
        
        self.outputDisplay.text = String(result)
        self.operand1String = String(result)
        return self.outputDisplay.text
    }
    
    func clear () {
        operand1String = ""
        operand2String = ""
        operatorType = nil
        outputDisplay.clear()
    }
}
