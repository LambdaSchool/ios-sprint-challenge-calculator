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
        
        if let unwrappedOperandTapped = sender.titleLabel?.text {
//            print(unwrappedOperandTapped)
//            brain?.addOperandDigit(unwrappedOperandTapped)
            outputLabel.text = brain?.addOperandDigit(unwrappedOperandTapped)
        } else {
            print("Not a valid operand")
            }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let unwrappedOperator = sender.titleLabel?.text {
            brain?.setOperator(unwrappedOperator)
            outputLabel.text = unwrappedOperator
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        outputLabel.text = brain?.calculateIfPossible()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        outputLabel.text = "_"
        brain = CalculatorBrain()
    }
}
