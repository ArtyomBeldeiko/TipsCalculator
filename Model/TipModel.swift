//
//  TipModel.swift
//  TipsCalculator
//
//  Created by Artyom Beldeiko on 25.10.21.
//

import Foundation
import RealmSwift

class Tips: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var amountPercents: Double = 0.0
    @Persisted var date: String = ""
    @Persisted var numberOfPayers: Int = 0
    @Persisted var currency: String = ""
    @Persisted var amountMoney: Double = 0
}


