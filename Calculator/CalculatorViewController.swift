//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!

    override func viewDidLoad() {
        brain = CalculatorBrain()
        super.viewDidLoad()
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let unwrappedNumber = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(unwrappedNumber)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let opertator = sender.titleLabel?.text {
            brain?.setOperator(opertator)
        }
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = brain?.calculateIfPossible() 
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = OperatorType(rawValue: "")
    }
}
