//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    /* 1. Create a property called brain of type CalculatorBrain.  Set the variable to be optional and do not give it an initial value
    */
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        
     /* 2. initialize a new CalculatorBrain object and assign it to the above property. */
        
         brain = CalculatorBrain()
        
        super.viewDidLoad()
            
    }
    
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
 
        // 3. a String which contains the text displayed on the button.
        if let digitString = sender.currentTitle {
            
        /* 4. call addOperandDigit on your brain and pass in the digit string.  That method returns the string you need to display on the screen, so assign the return value from that method to the text property of the outputLabel */
            
            outputLabel.text = brain?.addOperandDigit(digitString)
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let operatorString = sender.titleLabel?.text {
            
            brain?.setOperator(operatorString)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        if let brain = brain {
            
            if let equals = brain.calculateIfPossible() {
                outputLabel.text = equals
            }
        }

    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        // Call the clearTransaction method.  The outputLabel needs to be reset.
        
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
        // reset the brain object
        brain = CalculatorBrain()
    }
}

