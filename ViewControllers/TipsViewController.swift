//
//  TipsViewController.swift
//  TipsCalculator
//
//  Created by Artyom Beldeiko on 25.10.21.
//

import UIKit
import RealmSwift

class TipsViewController: UIViewController {
    
    @IBOutlet weak var receiptAmountTextField: UITextField!
    @IBOutlet weak var tipsAmountLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var savebutton: UIButton!
    
    var tips: Tips?
    var amountSpent: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        calculateButton.layer.cornerRadius = 12
        savebutton.isHidden = true
        
    }
    
    @IBAction func receiptAmountTextFieldTapped(_ sender: Any) {
        if receiptAmountTextField.text != nil {
            receiptAmountTextField.text = String(tips!.amountMoney)
        }
    }
    
    @IBAction func calculateButtonClicked(_ sender: Any) {
        let amountDouble = NSString(string: receiptAmountTextField.text!)
        let calculatedAmount = (amountDouble.doubleValue * tips!.amountPercents / 100) / Double(tips!.numberOfPayers)
        let roundedCalculatedAmount = Double(round(10 * calculatedAmount) / 10)
        amountSpent = roundedCalculatedAmount
        
        tipsAmountLabel.text = "The tips amount is \(roundedCalculatedAmount)"
        calculateButton.isHidden = true
        savebutton.isHidden = false
        
    }
    
    @IBAction func returnButtonClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func currentDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        return "\(day).\(month).\(year)"
    }
    
    func currentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        return "\(hour):\(minute)"
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write{
            if let tips = tips {
                tips.id = UUID().uuidString
                tips.amountMoney = amountSpent
                tips.date = currentDate()
                realm.add(tips, update: .all)
            }
        }
        
        print("Realm is here: \(Realm.Configuration.defaultConfiguration.fileURL!.path)")
    }
    
    @IBAction func listButtonClicked(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "SpendListViewController") as! SpendListViewController
        navigationController?.pushViewController(listVC, animated: true)
    }
    
}
