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
    
    //Extract text property from button
    @IBAction func operandTapped(_ sender: UIButton) {
        if let thisNumberString = sender.titleLabel?.text {
            outputLabel.text = brain?.addOperandDigit(thisNumberString)
                print("\(thisNumberString)")
            
        }
        
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = nil
    }
    
    // MARK: - Private
    
    //Reset the brain
    private func clearTransaction() {
        brain = nil
}
}
