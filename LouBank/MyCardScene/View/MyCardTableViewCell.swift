//
//  MyCardTableViewCell.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 1.11.22.
//

import UIKit

class MyCardTableViewCell: UITableViewCell {
    
    private let backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.backgroundColor = #colorLiteral(red: 0.1421872973, green: 0.144777745, blue: 0.170573473, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let numberCardlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16.0)
        return label
    }()
    
    private let dateCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 14.0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupColors()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutIfNeeded()
        cardView.applyGradient(colors: [#colorLiteral(red: 0.9825150371, green: 0.991471827, blue: 0.8708826303, alpha: 1).cgColor, #colorLiteral(red: 0.9380956888, green: 0.9751893878, blue: 0.5279017091, alpha: 1).cgColor],
                                   startPoint: CGPoint(x: 1, y: 0),
                                   endPoint: CGPoint(x: 0, y: 1))
        
        self.contentView.layoutIfNeeded()
    }
    
    func configureCellMyCard(myCard: MyCard) {
        numberCardlabel.text = myCard.fullnumerCard
        dateCardLabel.text = myCard.dateCardLabel
    }
}

private extension MyCardTableViewCell {
    func setupColors() {
        contentView.backgroundColor = #colorLiteral(red: 0.2472881377, green: 0.2239129543, blue: 0.2614909708, alpha: 1)
    }
    
    func setupViews() {
        contentView.addSubview(backgroundCell)
        backgroundCell.addSubview(cardView)
        backgroundCell.addSubview(numberCardlabel)
        backgroundCell.addSubview(dateCardLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            backgroundCell.heightAnchor.constraint(equalToConstant: 100),
            
            cardView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            cardView.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 20),
            
            cardView.heightAnchor.constraint(equalToConstant: 50),
            cardView.widthAnchor.constraint(equalToConstant: 70),
            
            numberCardlabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
            numberCardlabel.leftAnchor.constraint(equalTo: cardView.rightAnchor, constant: 20),
            
            dateCardLabel.topAnchor.constraint(equalTo: numberCardlabel.bottomAnchor),
            dateCardLabel.leftAnchor.constraint(equalTo: cardView.rightAnchor, constant: 20),
            dateCardLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -20),
        ])
    }
}
