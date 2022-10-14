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
        let alert = UIAlertController(title: nil, message: "Please, choose currency type.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            view.present(alert, animated: true)
        }
    }
}
