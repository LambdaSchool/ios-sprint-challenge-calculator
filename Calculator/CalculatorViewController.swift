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
    
    struct brain {
        var CalculatorBrain: Double?
        
        func addOperandDigit(Brain: Double) -> String {
           return ("0, 1, 2, 3, 4, 5, 6, 7, 8, 9")
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let CalculatorBrain = brain.self
        
        }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        guard let button = sender as? String else { return }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        outputLabel.text = ""
        clearTransaction()
            
        }
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain.self = ""
        clearTransaction()
        
    }

