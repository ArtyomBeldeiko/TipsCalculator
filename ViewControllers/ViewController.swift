//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Artyom Beldeiko on 22.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    var tips = Tips()
    
    @IBOutlet weak var tipsAmountSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPayersLabel: UILabel!
    @IBOutlet weak var PayersSlider: UISlider!
    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentValue = Int(PayersSlider.value)
        numberOfPayersLabel.text = "\(currentValue)"
        tips.numberOfPayers = currentValue
    }
    
    @IBAction func tipsAmountSegmentedControlClicked(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tips.amountPercents = 5
        case 1:
            tips.amountPercents = 10
        case 2:
            tips.amountPercents = 15
        default:
            tips.amountPercents = 5
        }
    }
    
    @IBAction func currencySegmentedControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tips.currency = "BYN"
        case 1:
            tips.currency = "RUB"
        case 2:
            tips.currency = "USD"
        case 3:
            tips.currency = "EUR"
        default:
            tips.currency = "BYN"
        }
    }
    
    @IBAction func sliderTapped(_ sender: UISlider) {
        let setValue = Int(sender.value)
        numberOfPayersLabel.text = "\(setValue)"
        tips.numberOfPayers = setValue
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        if tips.currency != "" {
            let tipsVC = self.storyboard?.instantiateViewController(withIdentifier: "TipsViewController") as! TipsViewController
            tipsVC.tips = tips
            navigationController?.pushViewController(tipsVC, animated: true)
        } else {
            AlertController.shared.showAlert(view: self)
        }
    }
}

