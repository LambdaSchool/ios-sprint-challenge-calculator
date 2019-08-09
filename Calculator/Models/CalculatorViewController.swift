//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var toOutputLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonPoint: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain(operand1String: "", operand2String: "", operatortype: nil)

    }
    var brain:CalculatorBrain?
    
    
    // MARK: - Action Handlers
  
    @IBAction func operandTapped(_ sender: UIButton) {
        if let buttonOutput = sender.titleLabel?.text {
        toOutputLabel.text = brain?.addOperandDigit(buttonOutput)
        }
  

 }

    
//operatorTapped function
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }

// equalTappedFunction
    
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let equalOutput = sender.titleLabel?.text {
        toOutputLabel.text = brain?.calculateIf
            
        }
        
//    brain.calculateIfPossible()
//    outputLabel.text
    }
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
