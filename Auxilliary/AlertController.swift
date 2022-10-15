//
//  AlertController.swift
//  TipsCalculator
//
//  Created by Artyom Beldeiko on 14.10.22.
//

import Foundation
import UIKit

class AlertController {
    static let shared = AlertController()
    
    func showAlert(view: UIViewController) {
        let alert = UIAlertController(title: nil, message: "", preferredStyle: .alert)
        let messageAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 17)!, NSAttributedString.Key.foregroundColor: UIColor.black]
        let messageString = NSAttributedString(string: "Please, choose currency type.", attributes: messageAttributes)
        alert.setValue(messageString, forKey: "attributedMessage")
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            view.present(alert, animated: true)
        }
    }
}
