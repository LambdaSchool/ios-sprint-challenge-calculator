//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brian: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brian = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let digit = sender.titleLabel?.text {
            outputLabel.text = brian?.addOperandDigit(digit)
        }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            brian?.setOperator(buttonText)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let equals = brian?.calculateIfPossible() {
            outputLabel.text = equals
            clearTransaction()
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brian = CalculatorBrain()
    }
}
