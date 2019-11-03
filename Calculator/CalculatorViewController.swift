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
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var dot: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        
        zero.setTitle("0", for: .normal)
        one.setTitle("1", for: .normal)
        two.setTitle("2", for: .normal)
        three.setTitle("3", for: .normal)
        four.setTitle("4", for: .normal)
        five.setTitle("5", for: .normal)
        six.setTitle("6", for: .normal)
        seven.setTitle("7", for: .normal)
        eight.setTitle("8", for: .normal)
        nine.setTitle("9", for: .normal)
        dot.setTitle(".", for: .normal)
        
        if let unwrappedZero = zero {
            print(unwrappedZero)
        } else if let unwrappedOne = one {
            print(unwrappedOne)
        } else if let unwrappedTwo = two {
            print(unwrappedTwo)
        } else if let unwrappedThree = three {
            print(unwrappedThree)
        } else if let unwrappedFour = four {
            print(unwrappedFour)
        } else if let unwrappedFive = five {
            print(unwrappedFive)
        } else if let unwrappedSix = six {
            print(unwrappedSix)
        } else if let unwrappedSeven = seven {
            print(unwrappedSeven)
        } else if let unwrappedEight = eight {
            print(unwrappedEight)
        } else if let unwrappedNine = nine {
            print(unwrappedNine)
        } else if let unwrappedDot = dot {
            print(unwrappedDot)
        }

    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {

    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}
