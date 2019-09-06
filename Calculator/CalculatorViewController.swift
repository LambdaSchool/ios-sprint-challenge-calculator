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
        var calculatorBrain = brain
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let number = sender.titleLabel?.text {
            brain?.addOperandDigit(number)
            outputLabel.text = number
        }
    }

    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
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
