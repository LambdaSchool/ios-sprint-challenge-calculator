//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    var brain: CalculatorBrain!
    var decimalCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let tappedOperand = sender.titleLabel?.text {
            if tappedOperand == "." && decimalCount == 0 {
                outputLabel.text = brain.addOperandDigit(tappedOperand)
                decimalCount = 1
            } else {
                if tappedOperand != "." {
                    outputLabel.text = brain.addOperandDigit(tappedOperand)
                }
            }
          
            
        }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let tappedOperator = sender.titleLabel?.text {
                brain.setOperator(tappedOperator)
            decimalCount = 0
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let result = brain.calculateIfPossible() {
            outputLabel.text = result
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
        
    }
    @IBAction func percentTapped(_ sender: UIButton) {
        outputLabel.text = brain.moveDecimal()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
        brain = CalculatorBrain()
        decimalCount = 0
    }
}
