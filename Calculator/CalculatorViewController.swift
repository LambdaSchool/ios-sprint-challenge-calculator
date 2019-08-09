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
        
        brain = CalculatorBrain()
        
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        var unwrappedDigitString = ""
        if let digitString = sender.titleLabel?.text {
            unwrappedDigitString = digitString
        }
        outputLabel.text = brain?.addOperandDigit(unwrappedDigitString)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        var unwrappedOperatorString = ""
        
        if let operatorString = sender.titleLabel?.text {
            unwrappedOperatorString = operatorString
        }
        brain?.setOperator(unwrappedOperatorString)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        var unwrappedCalculation = ""
        if let calculationString = brain?.calculateIfPossible() {
            unwrappedCalculation = calculationString
        }
        outputLabel.text = unwrappedCalculation
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
    }
}
