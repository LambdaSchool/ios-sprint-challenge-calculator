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
        
        if let numberInputText = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(numberInputText)
        } else {return}
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let operatorTextInput = sender.titleLabel?.text {
             brain?.setOperator(operatorTextInput)
        } else {return}
        
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let resultsToDisplay = brain?.calculateIfPossible() {
            outputLabel.text = resultsToDisplay
        } else {return}
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        outputLabel.text = "0"
        clearTransaction()
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        viewDidLoad()
        
    }
}
