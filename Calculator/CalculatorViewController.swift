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
        if let unwrappedBrain = brain, let senderTitle = sender.currentTitle {
            outputLabel.text = unwrappedBrain.addOperandDigit(senderTitle)
            
        } else {
            outputLabel.text = "Error: (001) Clear and try again."
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let unwrappedBrain = brain, let title = sender.currentTitle {
            outputLabel.text = unwrappedBrain.addOperandDigit(title)
        } else {
            outputLabel.text = "Error: (002) Clear and try again."
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let unwrappedBrain = brain {
            outputLabel.text = unwrappedBrain.calculateIfPossible()
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        brain = CalculatorBrain()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
