//
//  TableViewCell.swift
//  TipsCalculator
//
//  Created by Artyom Beldeiko on 7.11.21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
