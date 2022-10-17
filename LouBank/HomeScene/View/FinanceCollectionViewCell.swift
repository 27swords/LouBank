//
//  FinanceCollectionViewCell.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 10.10.22.
//

import UIKit

class FinanceCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Views
    var financeView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.149019599, green: 0.149019599, blue: 0.149019599, alpha: 1)
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var iconView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9442842603, green: 0.9763006568, blue: 0.5559069514, alpha: 1)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    //MARK: - Methods
    func configureCellFinance(finance: Finance) {
        nameLabel.text = finance.cellName
        iconImageView.image = finance.cellIcon
        iconView.backgroundColor = finance.colorCells
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Extensions
private extension FinanceCollectionViewCell {
    func setupView() {
        contentView.addSubview(financeView)
        
        financeView.addSubview(iconView)
        iconView.addSubview(iconImageView)
        financeView.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            financeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            financeView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            financeView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            financeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            iconView.topAnchor.constraint(equalTo: financeView.topAnchor, constant: 15),
            iconView.leftAnchor.constraint(equalTo: financeView.leftAnchor, constant: 20),
            
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 40),
            
            iconImageView.topAnchor.constraint(equalTo: iconView.topAnchor,constant: 10),
            iconImageView.leftAnchor.constraint(equalTo: iconView.leftAnchor, constant: 10),
            iconImageView.rightAnchor.constraint(equalTo: iconView.rightAnchor, constant: -10),
            iconImageView.bottomAnchor.constraint(equalTo: iconView.bottomAnchor, constant: -10),
            
            nameLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 15),
            nameLabel.leftAnchor.constraint(equalTo: financeView.leftAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: financeView.rightAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: financeView.bottomAnchor, constant: -10),
        ])
    }
}
