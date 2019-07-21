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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        init (calculatorBrain: String ){
            self.calculatorBrain = brain
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var decimal: UIButton!
    
    
    
   // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let number0 = number0.titleLabel {
            if let number1 = number1.titleLabel {
                if let number2 = number2.titleLabel {
                    if let number3 = number3.titleLabel {
                        if let number4 = number4.titleLabel {
                            if let number5 = number5.titleLabel {
                                if let number6 = number6.titleLabel {
                                    if let number7 = number7.titleLabel {
                                        if let number8 = number8.titleLabel {
                                            if let number9 = number9.titleLabel {
                                                if let decimal = decimal.titleLabel{
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
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
