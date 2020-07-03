//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Nguyen Truong Duy Khang on 7/2/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let lastPrice: Double
    let nameOfCurrency: String
    
    var lastPriceString: String {
        return String(format: "%.2f", lastPrice)
    }
}
