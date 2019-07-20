//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let operand = sender.titleLabel?.text {
            let output = brain?.addOperandDigit(operand)
            outputLabel.text = output
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let selectedOperator = sender.titleLabel?.text {
            if let brain = brain {
                brain.setOperator(selectedOperator)
            }
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let brain = brain {
            
            if brain.operand2String == "" {
                outputLabel.text = brain.operand1String
            } else {
                outputLabel.text = brain.calculateIfPossible()
            }
            
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
        brain = CalculatorBrain()
    }
}
