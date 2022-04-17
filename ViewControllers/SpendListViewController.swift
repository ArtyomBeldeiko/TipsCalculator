//
//  SpendListViewController.swift
//  TipsCalculator
//
//  Created by Artyom Beldeiko on 6.11.21.
//

import UIKit
import RealmSwift

class SpendListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var spendListTableView: UITableView!
    
    var tipsList: Results<Tips>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewCellXib = UINib(nibName: "TableViewCell", bundle: nil)
        spendListTableView.register(tableViewCellXib, forCellReuseIdentifier: "TableViewCell")
        
        spendListTableView.delegate = self
        spendListTableView.dataSource = self
        
        let realm = try! Realm()
        tipsList = realm.objects(Tips.self)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let tipItem = tipsList[indexPath.row]
        cell.amountLabel.text = "Amount: \(String(tipItem.amountMoney))"
        cell.currencyLabel.text = "Currency: \(tipItem.currency)"
        cell.dateLabel.text = "Date: \(tipItem.date)"
        return cell
    }
    
    @IBAction func backButtonCliked(_ sender: Any) {
        let appDelegate = AppDelegate()
        appDelegate.resetApp()
        navigationController?.popToRootViewController(animated: true)
    }
    
}
