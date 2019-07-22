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
    
     var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                brain = CalculatorBrain()
            }
 
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let pressedOperand = sender.titleLabel?.text {
            if let brain = brain {
           outputLabel.text = brain.addOperandDigit(pressedOperand)
            }
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let pressedOperator = sender.titleLabel?.text {
            if let brain = brain {
                brain.setOperator(pressedOperator)
            }
        }
    }

    @IBAction func equalTapped(_ sender: UIButton) {
            if let brain = brain?.calculateIfPossible() {
                outputLabel.text = brain
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
