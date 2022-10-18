//
//  CardsCollectionViewCell.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 10.10.22.
//

import UIKit

final class CardsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Views
    var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var paySystemImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "VisaImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var typeCardLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Light", size: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var numberCardLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Light", size: 12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutIfNeeded()
        cardView.applyGradient(colors: [#colorLiteral(red: 0.9825150371, green: 0.991471827, blue: 0.8708826303, alpha: 1).cgColor, #colorLiteral(red: 0.9380956888, green: 0.9751893878, blue: 0.5279017091, alpha: 1).cgColor],
                                   startPoint: CGPoint(x: 1, y: 0),
                                   endPoint: CGPoint(x: 0, y: 1))
        
        self.contentView.layoutIfNeeded()
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func configureCellCard(card: MyCard) {
        moneyLabel.text = card.cash
        numberCardLabel.text = card.numberCard
        typeCardLabel.text = card.typeCard
    }
}

//MARK: - Private Extension
private extension CardsCollectionViewCell {
    func setupView() {
        contentView.addSubview(cardView)
        
        cardView.addSubview(paySystemImage)
        cardView.addSubview(typeCardLabel)
        cardView.addSubview(moneyLabel)
        cardView.addSubview(numberCardLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
            paySystemImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            paySystemImage.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20),
            
            paySystemImage.widthAnchor.constraint(equalToConstant: 50),
            paySystemImage.heightAnchor.constraint(equalToConstant: 50),
            
            typeCardLabel.topAnchor.constraint(equalTo: paySystemImage.bottomAnchor, constant: 10),
            typeCardLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20),
            
            moneyLabel.topAnchor.constraint(equalTo: typeCardLabel.bottomAnchor, constant: 2),
            moneyLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20),
            moneyLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor),

            numberCardLabel.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 35),
            numberCardLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20),
            numberCardLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor),
            numberCardLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
        ])
    }
}
