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
    var stringDisplayed = ""
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        
        let brandNewBrain = CalculatorBrain()
        brain = brandNewBrain
        
        super.viewDidLoad()
    }
    
    
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let buttonTitle = sender.currentTitle {
            
            outputLabel.text = brain?.addOperandDigit(buttonTitle)
        }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let buttonTitle = sender.currentTitle {
            
            brain?.setOperator(buttonTitle)
            
        }
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        let result = brain?.calculateIfPossible()
        
        if let resultToDisplay = result {
            outputLabel.text = resultToDisplay
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
