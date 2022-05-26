//
//  CalculatorViewController.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 21/05/2022.
//

import UIKit




class CalculatorViewController: UIViewController {
    
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
    
    
    // MARK: - Calculator Themes
    
    var currentTheme: CalculatorTheme {
        return CalculatorTheme(backgroundColor: "#000000", displayColor: "#FFFFFF", extraFunctionColor: "#a6a6a6", extraFunctionTitleColor: "#FFFFFF", operationColor: "#ff9f0a", operationTitleColor: "#FFFFFF", pinPadColor: "#333333", pinPadTitleColor: "#FFFFFF")
    }
    
    
    // MARK: - Calculator Engine
    private var calculatorEngine = CalculatorEngine()
    
    

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
    }
    
    // MARK: - Decorate
    
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
        
        // Pinpad Buttons
        [
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
            decoratePinPadButton($0)
        }
        
        decoratePinPadButton(pinPadButton0, true)
        // Decimal Button
        decoratePinPadButton(decimalButton)

        
        // Extra function Buttons
        [
            clearButton,
            negateButton,
            percentageButton,
        ]
        .forEach {
            decorateExtraFunctionButton($0)
        }

        
        
        // Operations Buttons
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
    
    private func decorateButton(_ button: UIButton , _ usingScliedImage: Bool = false) {
        let image = usingScliedImage ? "CircleSliced" : "Circle"
        button.setBackgroundImage(UIImage(named: image), for: .normal )
        button.backgroundColor = .clear
    }
    
    
    private func decorateExtraFunctionButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraFunctionTitleColor), for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
    }
    
    
    private func decorateOperationButton(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.operationColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleColor), for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    }
    
    
    private func decoratePinPadButton(_ button: UIButton, _ usingScliedImage: Bool = false) {
        decorateButton(button, usingScliedImage)
                
        button.tintColor = UIColor(hex: currentTheme.pinPadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinPadTitleColor), for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    
    
    // MARK: - IBActions
    // MARK: - Extra Button

    @IBAction private func clearPressed() {
        calculatorEngine.clearPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func negatePressed() {
        calculatorEngine.negatePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func percentagePressed() {
        calculatorEngine.percentagePressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Operations
    
    @IBAction private func addPressed() {
        calculatorEngine.addPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func minusPressed() {
        calculatorEngine.minusPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        calculatorEngine.multiplyPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func dividePressed() {
        calculatorEngine.dividePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func equalsPressed() {
        calculatorEngine.equalsPressed()
        refreshLCDDisplay()
    }
    
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        calculatorEngine.decimalPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        let number = sender.tag
        calculatorEngine.numberPressed(number)
        refreshLCDDisplay()
    }

    
    // MARK: - Refresh LCDDisplay
    
    private func refreshLCDDisplay() {
        lcdDisplayLabel.text = calculatorEngine.lcdDisplayText
    }

}

