//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum OperatorType: String {
    case addition = "+"
    case subtraction = "-"
    case division = "÷"
    case multiplication = "×"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
    }
    
    func setOperator(_ operatorString: String) {
        
    }
    
    func calculateIfPossible() -> String? {
        
    }
}

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    var firstNumber: Double?
    var solution: Double?
    var performingMath = false
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad()/*(brain: CalculatorBrain?)*/ {
        super.viewDidLoad()
//        init (brain: CalculatorBrain?)  {
//            self.brain = brain
//        }
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        switch sender.tag{
            
        case 1:
            outputLabel.text = "1"
        case 2:
            outputLabel.text = "2"
        case 3:
            outputLabel.text = "3"
        case 4:
            outputLabel.text = "4"
        case 5:
            outputLabel.text = "5"
        case 6:
            outputLabel.text = "6"
        case 7:
            outputLabel.text = "7"
        case 8:
            outputLabel.text = "8"
        case 9:
            outputLabel.text = "9"
        case 0:
            outputLabel.text = "0"
        default:
            outputLabel.text = "0"
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
       // btn.showsButtonTappedWhenHighlighted = true
         switch sender.tag{
             
         case: OperatorType.addition
            outputLabel.text = "+"
         case: OperatorType.subtraction
             outputLabel.text = "-"
         case: OperatorType.division
             outputLabel.text = "÷"
         case: OperatorType.multiplication
             outputLabel.text = "×"
        
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
