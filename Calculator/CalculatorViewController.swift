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

	@IBOutlet weak var zeroButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
		let brainOfCalculator = brain
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
		if let operandString = sender.titleLabel?.text {
			outputLabel.text = brain?.addOperandDigit(operandString)
		} else {
			print("Not a valid value")
		}
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
		outputLabel.text == "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
		// need to reset the brain

    }
}
