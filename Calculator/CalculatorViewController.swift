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
        
        var digitString: String = "0"
        if let unwrappedDigit = sender.titleLabel?.text {
            digitString = unwrappedDigit
        }
        
       outputLabel.text = brain?.addOperandDigit(digitString)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        clearTransaction()
        
        // Default value
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
    
}
