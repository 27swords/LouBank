//
//  CardModel.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 10.10.22.
//

import UIKit

struct MyCard {
    var cash: String
    var numberCard: String
}

class CardModel {
    var card = [MyCard]()
    
    init() { myCardSetup() }
    
    func myCardSetup() {
        
        let card1 = MyCard(cash: "$ 1,3456", numberCard: "**2546")
        let card2 = MyCard(cash: "$ 12,3456", numberCard: "**7456")
        let card3 = MyCard(cash: "$ 14,3456", numberCard: "**4656")
        let card4 = MyCard(cash: "$ 11,3456", numberCard: "**2876")
        let card5 = MyCard(cash: "$ 0,3456", numberCard: "**7456")
        self.card = [card1, card2, card3, card4, card5]
    }
}
