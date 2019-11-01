//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    

    class CalculatorBrain {
        var operand1 = ""
        var operand2 = ""

        }
    let Brain = CalculatorBrain()
    
//    is this saying i made an change
//    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        CalculatorBrain {
            init(operand1)
        }
        super.viewDidLoad()
        
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
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
