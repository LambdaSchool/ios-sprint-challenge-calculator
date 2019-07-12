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
    var brain: CalculatorBrain?
    
    var number: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
        
        printNumber()
    }
    
    func printNumber() {
        outputLabel.text = number
    }
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        outputLabel.text = outputLabel.text! + String(sender.tag)
        }
    
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
