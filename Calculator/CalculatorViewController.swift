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
        if outputLabel?.text == "0"  {
            if let unwrapper = sender.titleLabel?.text {
                outputLabel.text = unwrapper
            }
        }
        else {
            if let unwrapper = sender.titleLabel?.text {
                outputLabel.text = (outputLabel.text ?? "") + unwrapper
            }
        }
    }
        
    @IBAction func operatorTapped(_ sender: UIButton) {
        
        outputLabel.text = sender.titleLabel?.text
        }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        brain?.calculateIfPossible()
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = CalculatorBrain()
        outputLabel.text = "0"
    }
}
