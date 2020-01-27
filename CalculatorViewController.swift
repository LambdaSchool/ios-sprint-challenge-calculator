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
        
        outputLabel.text = "1"
     }
    var Newbrain = CalculatorBrain()
    

        
  
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let numberTapped = sender.titleLabel?.text {
            outputLabel.text = numberTapped
        }
        
        brain?.addOperandDigit(digit:String) {
            
            func append(operand1String: addition)
        }
       
        
        return outputLabel.text = "0"

    }
        

        
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        var Clear = clearTransaction
        
        outputLabel.text = "0"
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        func
        
            CalculatorBrain() {
            
        }
        outputLabel.text = "0"
            
            
        
        
        
    }
}

