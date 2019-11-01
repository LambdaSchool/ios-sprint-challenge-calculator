//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

var brain: CalculatorBrain?

class CalculatorViewController: UIViewController, CalculatorBrain {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var calcBrain = brain
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton)
    {
        if let number = sender.titleLabel?.text
        {
            let chosenNumber = Double(number) ?? 0.0
            let convertedCalc = brain?.addOperandDigit(chosenNumber)
            outputLabel.text = "\(convertedCalc)"
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
