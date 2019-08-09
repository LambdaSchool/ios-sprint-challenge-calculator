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
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var b: CalculatorBrain?
        
    }
    
    // MARK: - Action Handlers
    
    //Extract text property from button
    @IBAction func operandTapped(_ sender: UIButton) {
        if let thisNumberString = sender.titleLabel?.text {
            sender.titleLabel?.text = thisNumberString
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
    
    private func clearTransaction() {
        self = brain    }
}
