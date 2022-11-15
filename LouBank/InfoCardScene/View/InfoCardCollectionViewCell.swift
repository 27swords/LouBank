//
//  InfoCardCollectionViewCell.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 18.10.22.
//

import UIKit

final class InfoCardCollectionViewCell: UICollectionViewCell {
    //MARK: - Views
    var backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var paySystemImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    var moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 24.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var numberCardLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dateCardLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ownerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Light", size: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutIfNeeded()
        backgroundCell.applyGradient(colors: [#colorLiteral(red: 0.9825150371, green: 0.991471827, blue: 0.8708826303, alpha: 1).cgColor, #colorLiteral(red: 0.9380956888, green: 0.9751893878, blue: 0.5279017091, alpha: 1).cgColor],
                                   startPoint: CGPoint(x: 1, y: 0),
                                   endPoint: CGPoint(x: 0, y: 1))
        
        self.contentView.layoutIfNeeded()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func configureCellCard(card: MyCard) {
        paySystemImage.image = card.paySystem
        moneyLabel.text = "$" + card.cash
        numberCardLabel.text = card.fullnumerCard
        dateCardLabel.text = card.dateCardLabel
        ownerNameLabel.text = card.ownerNameLabel
    }
}

private extension InfoCardCollectionViewCell {
    func setupViews() {
        contentView.addSubview(backgroundCell)
        backgroundCell.addSubview(paySystemImage)
        backgroundCell.addSubview(moneyLabel)
        backgroundCell.addSubview(numberCardLabel)
        backgroundCell.addSubview(dateCardLabel)
        backgroundCell.addSubview(ownerNameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            paySystemImage.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
            paySystemImage.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 30),
            
            paySystemImage.heightAnchor.constraint(equalToConstant: 55),
            paySystemImage.widthAnchor.constraint(equalToConstant: 55),
            
            moneyLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 34),
            moneyLabel.leftAnchor.constraint(equalTo: paySystemImage.rightAnchor, constant: 120),
            moneyLabel.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor, constant: -10),
            
            numberCardLabel.topAnchor.constraint(equalTo: paySystemImage.bottomAnchor,constant: 50),
            numberCardLabel.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 30),
            
            dateCardLabel.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 63),
            dateCardLabel.leftAnchor.constraint(equalTo: numberCardLabel.rightAnchor, constant: 70),
            dateCardLabel.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor, constant: -10),
            
            ownerNameLabel.topAnchor.constraint(equalTo: numberCardLabel.bottomAnchor),
            ownerNameLabel.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 30),
            ownerNameLabel.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor),
            ownerNameLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -15)
        ])
    }
}
