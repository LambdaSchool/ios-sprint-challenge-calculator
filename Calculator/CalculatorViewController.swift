//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    struct Brain {
        var calculatorBrain: Double?
        
        func addOperandDigit(Brain: Double) -> String {
           return ("0, 1, 2, 3, 4, 5, 6, 7, 8, 9")
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var calculatorBrain = Brain.self
        
        }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        if let 
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
