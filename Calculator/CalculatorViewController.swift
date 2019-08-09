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
    
    // In viewDidLoad, initialize a new CalculatorBrain object and assign it to the above property.
    override func viewDidLoad() {

        super.viewDidLoad()
        
        var CalculatorBrain = brain
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        outputLabel.isEnabled = true
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        outputLabel.isEnabled = true
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        outputLabel.isEnabled = true
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        outputLabel.isEnabled = true
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
