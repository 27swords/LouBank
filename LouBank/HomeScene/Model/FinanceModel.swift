//
//  FinanceModel.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 13.10.22.
//

import UIKit

struct Finance {
    var cellName: String
    var cellIcon: UIImage?
    var colorCells: UIColor?
}

class FinanceModel {
    
    var finance = [Finance]()
    
    init() { financeSetup() }
    
    func financeSetup() {
        let myBonuces = Finance(cellName: "Бонусы",
                                cellIcon: UIImage(named: "myBonucesIcon"),
                                colorCells: #colorLiteral(red: 0.9444041848, green: 0.9759250283, blue: 0.5435984135, alpha: 1))
        
        let myBudget = Finance(cellName: "Бюджет",
                               cellIcon: UIImage(named: "myBudgetIcon"),
                               colorCells: #colorLiteral(red: 0.6964657903, green: 0.8139244914, blue: 0.8080486655, alpha: 1))
        
        let financeAnalysis = Finance(cellName: "Курс валют",
                                      cellIcon: UIImage(named: "financeAnalysisIcon"),
                                      colorCells: #colorLiteral(red: 0.6660589576, green: 0.6185450554, blue: 0.7186105847, alpha: 1))
        
        let testCell = Finance(cellName: "Test",
                               cellIcon: UIImage(named: "myBonucesIcon"),
                               colorCells: #colorLiteral(red: 0.9444041848, green: 0.9759250283, blue: 0.5435984135, alpha: 1))
        
        self.finance = [myBonuces, myBudget, financeAnalysis, testCell]
    }
}
