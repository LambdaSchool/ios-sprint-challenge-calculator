//
//  calculator.swift
//  Calculator
//
//  Created by alfredo on 12/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum ButtonType{
    case functionButton
    case operatorButton
    case equalButton
    case operandButtonForFunctionY
    case operandButtonForFunctionX
    case operandButtonForOperand2
    case operandButtonForOperand1
    case decimalButton
    case percentageButton
}
enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "x"
    case division = "÷"
    var  precedence: Int {
          switch self{
          case .addition:  return 0
          case .subtraction: return 0
          case .division: return 1
          case .multiplication: return 1
          }
      }
}
