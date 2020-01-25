//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

var brain: CalculatorBrain?

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        brain = CalculatorBrain()
        super.viewDidLoad()
        let anotherBrain = brain
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let operandText = outputLabel.text
        
            else {
            return
     }
    }
    
        
    
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        calculateIfPossible(brain)
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
    clearTransaction(0)
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
