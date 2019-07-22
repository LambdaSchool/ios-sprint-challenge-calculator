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
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    init(operand1String: String, operand2String: String) {
        self.operand1String = operand1String
        self.operand2String = operand2String
        self.operatorType = OperatorType.addition
    }
    
    
    func addOperandDigit(_ digit: String) -> String {

    }
    
    func setOperator(_ operatorString: String) {

    }

}
