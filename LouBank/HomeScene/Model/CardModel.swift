//
//  CardModel.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 10.10.22.
//

import Foundation

struct MyCard {
    var id: Int
    var cash: String
    var numberCard: String
    var typeCard: String
}

final class CardModel {
    var card = [MyCard]()
    
    init() { myCardSetup() }
    
    func myCardSetup() {
        
        let card1 = MyCard(id: 1, cash: "$ 1,345", numberCard: "**2546", typeCard: "Зарплатная")
        let card2 = MyCard(id: 2, cash: "$ 12,345", numberCard: "**7456", typeCard: "Кредитная")
        let card3 = MyCard(id: 3, cash: "$ 14,345", numberCard: "**4656", typeCard: "Туда-суда")
        let card4 = MyCard(id: 4, cash: "$ 11,345", numberCard: "**2876", typeCard: "Родительская")
        let card5 = MyCard(id: 5, cash: "$ 345", numberCard: "**7456", typeCard: "Пустая")
        self.card = [card1, card2, card3, card4, card5]
    }
}
