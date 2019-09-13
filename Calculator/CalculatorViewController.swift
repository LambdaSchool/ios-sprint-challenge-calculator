//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var decimalButton: UIButton!
    var brain: CalculatorBrain?
    var tapCounter = 0
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       createNewCalculator()
       
    }
    
  
    private func createNewCalculator() {
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if sender.tag == 123 {
            tapCounter += 1
        }
        
        if tapCounter < 1 {
             decimalButton.isEnabled = true
        } else {
            decimalButton.isEnabled = false
        }
        guard let textValue = sender.titleLabel?.text else { return }
        outputLabel.text = brain?.addOperandDigit(textValue)
      
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let textValue = sender.titleLabel?.text else { return }
        brain?.setOperator(textValue)
        tapCounter = 0
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let calculateIfPossibleResult = brain?.calculateIfPossible() {
            outputLabel.text =  calculateIfPossibleResult
            clearTransaction()
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
        createNewCalculator()
    }
}
