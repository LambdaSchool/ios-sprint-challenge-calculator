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
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnSubtract: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    private let brain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else { return }
//        print(operand)
        noOpsSelected()
        outputLabel.text = brain.addOperandDigit(operand)
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let op = sender.titleLabel?.text else { return }
        let wasSelected = sender.isSelected
        
        noOpsSelected()
        
        if !wasSelected {
            sender.isSelected = true
            brain.setOperator(op)
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()

    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        noOpsSelected()
        brain.clear()
        outputLabel.text = "0"
    }
    
    private func noOpsSelected() {
        btnDivide.isSelected = false
        btnMultiply.isSelected = false
        btnSubtract.isSelected = false
        btnAdd.isSelected = false
    }
}
