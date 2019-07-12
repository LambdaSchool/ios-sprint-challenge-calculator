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
	
	var calculatorBrain: CalculatorBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		calculatorBrain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
		guard let selectedOperand = sender.titleLabel?.text else { return }
		
		outputLabel.text = calculatorBrain?.addOperandDigit(selectedOperand)
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
		calculatorBrain = CalculatorBrain()
		outputLabel.text = "0"
    }
}
