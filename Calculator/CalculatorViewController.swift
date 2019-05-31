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
		if let numberOperand = sender.titleLabel?.text {
			outputLabel.text = brain?.addOperandDigit(numberOperand)
		}
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
		if let operatorButton = sender.titleLabel?.text {
			brain?.setOperator(operatorButton)
		}
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
		if let solution = brain?.calculateIfPossible() {
			outputLabel.text = solution
			clearTransaction()
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

//Changed: brain name, added `brain = nil` before `brain CalculatorBrain?` on line 51, added line 52 (from instructor), added line 37, 38, & 39 (Instructor)
