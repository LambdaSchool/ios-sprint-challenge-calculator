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
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let unwrappedText = sender.currentTitle {
            let displayText = brain?.addOperandDigit(unwrappedText)
            outputLabel.text = displayText
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let unwrappedText = sender.currentTitle {
            brain?.setOperator(unwrappedText)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let unwrappedBrainCalculator = brain?.calculateIfPossible() {
            
        } else {
            return
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
