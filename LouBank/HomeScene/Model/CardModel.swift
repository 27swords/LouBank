//
//  CardModel.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 10.10.22.
//

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
    
    var transferAmount: String?
    var withdrawalMoney: String?
    var transfer: String?
    var withdrawal: String?
    
    var transferImage: UIImage?
    var withdrawalImage: UIImage?
    
    var transferColor: UIColor?
    var withdrawalColor: UIColor?
}

final class CardModel {
    var card = [MyCard]()
    
    init() { myCardSetup() }
    
    func myCardSetup() {
        
        let card1 = MyCard(
            id: 1,
            cash: "1,345",
            numberCard: "**2546",
            fullnumerCard: "**** **** **** 2546",
            typeCard: "Зарплатная",
            dateCardLabel: "12/43",
            ownerNameLabel: "ALIAKSANDR THERVONTSAU",
            paySystem: UIImage(named: "VisaImage"),
            transferAmount: "+ $3498.45",
            transfer: "Пополнение",
            transferImage: UIImage(named: "TransferImage"),
            transferColor: #colorLiteral(red: 0.9475767016, green: 0.9762555957, blue: 0.5499872565, alpha: 1)
            
        )
        
        let card2 = MyCard(
            id: 2,
            cash: "12,345",
            numberCard: "**7456",
            fullnumerCard: "**** **** **** 7456",
            typeCard: "Кредитная",
            dateCardLabel: "12/43",
            ownerNameLabel: "ALIAKSANDR THERVONTSAU",
            paySystem: UIImage(named: "VisaImage"),
            withdrawalMoney: "- $345",
            withdrawal: "Снятие",
            withdrawalImage: UIImage(named: "WithdrawalImage"),
            withdrawalColor: #colorLiteral(red: 0.6964657903, green: 0.8139244914, blue: 0.8080486655, alpha: 1)
        )
        
        let card3 = MyCard(
            id: 3,
            cash: "14,345",
            numberCard: "**4656",
            fullnumerCard: "**** **** **** 4656",
            typeCard: "Туда-суда",
            dateCardLabel: "12/43",
            ownerNameLabel: "ALIAKSANDR THERVONTSAU",
            paySystem: UIImage(named: "VisaImage"),
            transferAmount: "+ $2356.45",
            transfer: "Пополнение",
            transferImage: UIImage(named: "TransferImage"),
            transferColor: #colorLiteral(red: 0.9475767016, green: 0.9762555957, blue: 0.5499872565, alpha: 1)
        )
        
        let card4 = MyCard(
            id: 4,
            cash: "11,345",
            numberCard: "**2876",
            fullnumerCard: "**** **** **** 2876",
            typeCard: "Родительская",
            dateCardLabel: "12/43",
            ownerNameLabel: "ALIAKSANDR THERVONTSAU",
            paySystem: UIImage(named: "VisaImage"),
            withdrawalMoney: "- $2000",
            withdrawal: "Снятие",
            transferImage: UIImage(named: "TransferImage"),
            withdrawalColor: #colorLiteral(red: 0.6964657903, green: 0.8139244914, blue: 0.8080486655, alpha: 1)
        )
        
        
        let card5 = MyCard(
            id: 5,
            cash: "345",
            numberCard: "**7456",
            fullnumerCard: "**** **** **** 7456",
            typeCard: "Пустая",
            dateCardLabel: "12/43",
            ownerNameLabel: "ALIAKSANDR THERVONTSAU",
            paySystem: UIImage(named: "VisaImage"),
            transferAmount: "+ $3256.45",
            transfer: "Пополнение",
            transferImage: UIImage(named: "TransferImage"),
            transferColor: #colorLiteral(red: 0.9475767016, green: 0.9762555957, blue: 0.5499872565, alpha: 1)
        )
        
        self.card = [card1, card2, card3, card4, card5]
    }
}
