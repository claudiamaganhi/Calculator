//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Claudia Cavalini Maganhi on 14/04/20.
//  Copyright © 2020 Claudia Cavalini Maganhi. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultDisplayLabel: UILabel!
    
    var isFinishedTypingNumber: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculatorPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        
        if isFinishedTypingNumber {
            resultDisplayLabel.text = number
            isFinishedTypingNumber = false
        } else {
            guard let newNumber = resultDisplayLabel.text else { return }
            resultDisplayLabel.text = newNumber + number
        }
        
        
    }
    


}

