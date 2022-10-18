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
    var typeCard: String
}

final class CardModel {
    var card = [MyCard]()
    
    init() { myCardSetup() }
    
    func myCardSetup() {
        
        let card1 = MyCard(cash: "$ 1,345", numberCard: "**2546", typeCard: "Зарплатная")
        let card2 = MyCard(cash: "$ 12,345", numberCard: "**7456", typeCard: "Кредитная")
        let card3 = MyCard(cash: "$ 14,345", numberCard: "**4656", typeCard: "Туда-суда")
        let card4 = MyCard(cash: "$ 11,345", numberCard: "**2876", typeCard: "Родительская")
        let card5 = MyCard(cash: "$ 345", numberCard: "**7456", typeCard: "Пустая")
        self.card = [card1, card2, card3, card4, card5]
    }
}
