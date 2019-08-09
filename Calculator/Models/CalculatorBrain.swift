//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
//operand enum

enum OperatorType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

// calculator brain class

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    init(operand1String: String, operand2String: String, operatortype: OperatorType?) {
        self.operand1String = operand1String
        self.operand2String = operand2String
    }
//    func whichOperand
    
    
// addOperandDigit function
    
   
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            let digit = operand1String
        } else {
            let digit = operand2String
        }
    return digit

    
// setOperator function
    
    func setOperator(_ operatorString: String) {
        
        
    }
// calculateIfPossible function
    
        func calculateIfPossible() -> String? {
        guard let operand1 = Double(operand1String) else { return nil }
        guard let operand2 = Double(operand2String) else { return nil }
        guard let operatorType = operatorType else {return nil}
        
        switch operatorType{
        case .addition :
            let math = operand1 + operand2
            return "\(math)"
            
        case .subtraction:
            let math = operand1 - operand2
            return "\(math)"
            
        case .multiplication:
            let math = operand1 * operand2
            return "\(math)"
            
        case .division:
            let math = operand1 / operand2
            return "\(math)"
            
      print("\(math)")
    }
            if let math == nil
                
            }

}


}
}
