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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let brain: CalculatorBrain?
        brain = CalculatorBrain()
        
        
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        func getOperand() -> String {
        if let unwrappedButtonTapped = title {
            print(unwrappedButtonTapped)
        }
        }
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
