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
            guard let doesHaveDecimal = outputLabel.text?.contains(".") else {
                return
            }
            if doesHaveDecimal && unwrappedText == "." {
                return
            }
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
        if sender.currentTitle != nil {
            let displayEqualText = brain?.calculateIfPossible()
            outputLabel.text = displayEqualText
            
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
