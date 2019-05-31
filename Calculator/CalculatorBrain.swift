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
    
var selectedOperator: OperatorType {
    switch selectedOperator {
    case .addition:
        return OperatorType(rawValue: "+")!
    case .subtraction:
        return OperatorType(rawValue: "-")!
    case .multiplication:
        return OperatorType(rawValue: "*")!
    case .division:
        return OperatorType(rawValue: "/")!
        
    default:
        break
    }
    
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType = OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
    
        if operand1String != "" {
            operand1String.append(selectedOperator.rawValue)
        } else {
            return ""

        
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
    func calculateIfPossible() -> String? {
        
    }
}
}
