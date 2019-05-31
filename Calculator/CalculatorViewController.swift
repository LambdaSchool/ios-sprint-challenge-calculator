//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
	
	var calculatorBrain: CalculatorBrain?
	
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		calculatorBrain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
		if let numberOperand = sender.titleLabel?.text {
			outputLabel.text = calculatorBrain?.addOperandDigit(numberOperand)
		}
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
		
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
		clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = ""
		calculatorBrain = CalculatorBrain()
    }
}
