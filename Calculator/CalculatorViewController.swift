//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

var brain: CalculatorBrain?

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       brain = CalculatorBrain()
    }
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
     
    if let enteredValue = sender.titleLabel?.text {
            outputLabel.text =
            brain?.addOperandDigit(enteredValue)
    }
    }
    @IBAction func operatorTapped(_ sender: UIButton) {
    
       
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain?.operand1String = ""
        brain?.operand2String = ""
        brain?.operatorType = nil
    }
}

