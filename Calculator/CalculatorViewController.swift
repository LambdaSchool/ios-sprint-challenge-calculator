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
        
        var B = brain
            }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let digitString = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(digitString)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let operation = sender.titleLabel?.text {
            brain?.setOperator(operation)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        ifcalculateIfPossible()    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        let defaultValue = "0"
        outputLabel.text = defaultValue
        
    }
   
}
