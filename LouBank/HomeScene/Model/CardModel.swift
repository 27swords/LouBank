//
//  CardModel.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 10.10.22.
//

import Foundation
import UIKit

struct MyCard {
    var id: Int
    var cash: String
    var numberCard: String
    var fullnumerCard: String
    var typeCard: String
    var dateCardLabel: String
    var ownerNameLabel: String
    var paySystem: UIImage?
}

final class CardModel {
    var card = [MyCard]()
    
    init() { myCardSetup() }
    
    func myCardSetup() {
        
        let card1 = MyCard(
            id: 1,
            cash: "$ 1,345",
            numberCard: "**2546",
            fullnumerCard: "**** **** **** 2546",
            typeCard: "Зарплатная",
            dateCardLabel: "12/43",
            ownerNameLabel: "user name",
            paySystem: UIImage(named: "VisaImage")
        )
        
        let card2 = MyCard(
            id: 2,
            cash: "$ 12,345",
            numberCard: "**7456",
            fullnumerCard: "**** **** **** 7456",
            typeCard: "Кредитная",
            dateCardLabel: "12/43",
            ownerNameLabel: "user name",
            paySystem: UIImage(named: "VisaImage")
        )
        
        let card3 = MyCard(
            id: 3,
            cash: "$ 14,345",
            numberCard: "**4656",
            fullnumerCard: "**** **** **** 4656",
            typeCard: "Туда-суда",
            dateCardLabel: "12/43",
            ownerNameLabel: "user name",
            paySystem: UIImage(named: "VisaImage")
        )
        
        let card4 = MyCard(
            id: 4,
            cash: "$ 11,345",
            numberCard: "**2876",
            fullnumerCard: "**** **** **** 2876",
            typeCard: "Родительская",
            dateCardLabel: "12/43",
            ownerNameLabel: "user name",
            paySystem: UIImage(named: "VisaImage")
        )
        
        
        let card5 = MyCard(
            id: 5,
            cash: "$ 345",
            numberCard: "**7456",
            fullnumerCard: "**** **** **** 7456",
            typeCard: "Пустая",
            dateCardLabel: "12/43",
            ownerNameLabel: "user name",
            paySystem: UIImage(named: "VisaImage")
        )
        
        self.card = [card1, card2, card3, card4, card5]
    }
}
