//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Properties / Outlets
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var brain: CalculatorBrain?
    
    override func viewDidLoad() {
        
        brain = CalculatorBrain()
        
        super.viewDidLoad()
    }
    
    // MARK: - Actions / Buttons
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let digitAsString = sender.currentTitle {

            outputLabel.text = brain?.addOperandDigit(digitAsString)
            
        }
                
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        if let operatorAsString = sender.titleLabel?.text {
            
            brain?.setOperator(operatorAsString)
            
        }
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
        // do i need to define brain property here?
        if let brainConstant = brain {
            
            if let unwrappedSolutionAsString = brainConstant.calculateIfPossible() {
                
                outputLabel.text = unwrappedSolutionAsString
            
        }
            
        }
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        clearTransaction()
        
        outputLabel.text = "0"
        
    }
    
    // MARK: - Private / Helper Functions
    
    private func clearTransaction() {
        
        brain = CalculatorBrain()
        
    }
}
