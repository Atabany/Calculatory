//
//  ViewController.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 21/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var pinPadButton0: UIButton!
    @IBOutlet weak var pinPadButton1: UIButton!
    @IBOutlet weak var pinPadButton2: UIButton!
    @IBOutlet weak var pinPadButton3: UIButton!
    @IBOutlet weak var pinPadButton4: UIButton!
    @IBOutlet weak var pinPadButton5: UIButton!
    @IBOutlet weak var pinPadButton6: UIButton!
    @IBOutlet weak var pinPadButton7: UIButton!
    @IBOutlet weak var pinPadButton8: UIButton!
    @IBOutlet weak var pinPadButton9: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var negateButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var decimalButton: UIButton!
    
    @IBOutlet weak var equalsButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decorateView()
    }
    
    
    private func decorateView() {
        [
            pinPadButton0,
            pinPadButton1,
            pinPadButton2,
            pinPadButton3,
            pinPadButton4,
            pinPadButton5,
            pinPadButton6,
            pinPadButton7,
            pinPadButton8,
            pinPadButton9,
        ] .forEach {
            decorateButton($0)
        }
        
        
        
        [
            clearButton,
            negateButton,
            percentageButton,
            
            divideButton,
            multiplyButton,
            addButton,
            minusButton,
            equalsButton,
            
            decimalButton
        ]
            
            .forEach {
                decorateButton($0)
            }
        
        
        
        
    }
    
    private func decorateButton(_ button: UIButton) {
        button.setBackgroundImage(UIImage(named: "Circle"), for: .normal )
        button.backgroundColor = .clear
        button.tintColor = .orange
    }
    
    
}

