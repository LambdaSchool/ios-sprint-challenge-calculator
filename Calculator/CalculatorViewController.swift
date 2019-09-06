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
        if let number = sender.titleLabel?.text {
            let displayNum = brain?.addOperandDigit(number)
            outputLabel.text = displayNum
        }
    }

    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operatorSymbol = sender.titleLabel?.text {
            _ = brain?.setOperator(operatorSymbol)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        let executeEquation = brain?.calculateIfPossible()
        outputLabel.text = executeEquation
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        self.viewDidLoad()
    }
}
