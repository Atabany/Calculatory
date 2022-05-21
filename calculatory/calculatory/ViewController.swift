//
//  ViewController.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 21/05/2022.
//

import UIKit




class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var lcdDisplay: UIView!
    @IBOutlet weak var lcdDisplayLabel: UILabel!
    
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
    
    
    
    var currentTheme: CalculatorTheme {
        return CalculatorTheme(backgroundColor: "#000000", displayColor: "#FFFFFF", extraFunctionColor: "#000000", extraFunctionTitleColor: "#FFFFFF", operationColor: "#000000", operationTitleColor: "#FFFFFF", pinPadColor: "#000000", pinPadTitleColor: "#FFFFFF")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
    }
    
    
    private func decorateView() {
        decorateBackground()
        decorateLCDDisplay()
        decorateButtons()
    }
    
    
    
    
    private func decorateBackground() {
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
    }
    
    private func decorateLCDDisplay() {
        lcdDisplay.backgroundColor = .clear
        lcdDisplayLabel.textColor = UIColor(hex: currentTheme.displayColor)
    }

    
    
    
    private func decorateButtons() {
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
            decimalButton
        ] .forEach {
            decoratePinPadButton($0)
        }

        [
            clearButton,
            negateButton,
            percentageButton,
        ]
        .forEach {
            decorateExtraFunctionButton($0)
        }

        [divideButton,
         multiplyButton,
         addButton,
         minusButton,
         equalsButton,
        ]
        .forEach {
            decorateOperationButton($0)
        }
        
    }
    
    private func decorateButton(_ button: UIButton) {
        button.setBackgroundImage(UIImage(named: "Circle"), for: .normal )
        button.backgroundColor = .clear
    }
    
    
    private func decorateExtraFunctionButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraFunctionTitleColor), for: .normal)
    }
    
    
    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.operationColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleColor), for: .normal)
    }
    
    
    private func decoratePinPadButton(_ button: UIButton) {
        decorateButton(button)
                
        button.tintColor = UIColor(hex: currentTheme.pinPadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinPadTitleColor), for: .normal)
    }
    
    
    
    
    
    
    
    
    
    
}

