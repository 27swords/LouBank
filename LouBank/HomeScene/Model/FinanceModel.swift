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
}

class FinanceModel {
    
    var finance = [Finance]()
    
    init() { financeSetup() }
    
    func financeSetup() {
        let myBonuces = Finance(cellName: "Бонусы",
                                cellIcon: UIImage(named: "myBonucesIcon"))
        
        let myBudget = Finance(cellName: "Бюджет",
                               cellIcon: UIImage(named: "myBudgetIcon"))
        
        let financeAnalysis = Finance(cellName: "Курс валют",
                                      cellIcon: UIImage(named: "financeAnalysisIcon"))
        
        let testCell = Finance(cellName: "Test",
                               cellIcon: UIImage(named: "myBonucesIcon"))
        
        self.finance = [myBonuces, myBudget, financeAnalysis, testCell]
    }
}
