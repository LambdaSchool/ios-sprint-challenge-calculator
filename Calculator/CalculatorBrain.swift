//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit


enum OperatorType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    case notSelected
}

class CalculatorBrain {
    var brain: Int?
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    init(brain: Int?, _ operand1String: String?, _ operand2String: String?, operatorType: OperatorType?) {
        self.brain = brain
        self.operand1String = operand1String!
        self.operand2String = operand2String!
        self.operatorType = operatorType
    }
    
}

//func addOperandDigit(_ digit: String) -> String {
//    
//}
//
//func setOperator(_ operatorString: String) {
//
//}
//
//func calculateIfPossible() -> String? {
//
//}
