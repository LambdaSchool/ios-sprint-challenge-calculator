//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain? = CalculatorBrain()
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentBrain = brain
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let currentNumber = sender.titleLabel?.text else {
            return
        }
        
        if let textToPrint = brain?.addOperandDigit(currentNumber) {
            outputLabel.text = textToPrint
      } else {
            outputLabel.text = "error"
        }
 
 }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        guard let currentOperater = sender.titleLabel?.text else {
            return
        }
        
        guard let passedOperator = brain?.setOperator(currentOperater) else {
            outputLabel.text = "error"
            return
        }
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let textToPrint = brain?.calculateIfPossible()
        outputLabel.text = textToPrint
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = "0"
        let newBrain = CalculatorBrain()
        brain = newBrain
    }
}
