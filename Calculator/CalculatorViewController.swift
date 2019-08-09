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
        
        var theBrain = brain
            }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let digitString = sender.titleLabel?.text {
            guard let unwrappedBrain = brain else { return }
            outputLabel.text = unwrappedBrain.addOperandDigit(digitString)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let operation = sender.titleLabel?.text {
            brain?.setOperator(operation)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let equal = brain?.calculateIfPossible() {
        outputLabel.text = brain?.calculateIfPossible(equal)
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        let defaultValue = "0"
        outputLabel.text = defaultValue
        
    }
   
}
