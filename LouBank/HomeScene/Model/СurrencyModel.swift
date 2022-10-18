//
//  СurrencyModel.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 17.10.22.
//

import UIKit

struct Сurrency {
    var buyDollar: String
    var seliDollar: String
    
    var byuEuro: String
    var seliEuro: String
}

final class СurrencyModel {
    
    var сurrency = [Сurrency]()
    
    init() { сurrencySetup() }
    
    func сurrencySetup() {
        let exchangeRate = Сurrency(buyDollar: "$ 34.34",
                                    seliDollar: "$ 44.34",
                                    byuEuro: "$ 54.34",
                                    seliEuro: "$ 64.34")
        
        self.сurrency = [exchangeRate]
    }
}
