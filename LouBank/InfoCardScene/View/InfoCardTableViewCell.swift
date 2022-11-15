//
//  InfoCardTableViewCell.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 18.10.22.
//

import UIKit

class InfoCardTableViewCell: UITableViewCell {
    
    //MARK: - Views
    var backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1373701394, green: 0.1371837854, blue: 0.1457717419, alpha: 1)
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var transferView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var transferImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var transferLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cashTransferLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16)
        label.text = "+ $5354.30"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var numberCardLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Light", size: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lyfe Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        setupColors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        transferView.layer.cornerRadius = transferView.frame.size.width/2
    }
    
    //MARK: - Methods
    func configureTransferCell(transfer: MyCard) {
        cashTransferLabel.text = transfer.transferAmount ?? transfer.withdrawalMoney
        transferLabel.text = transfer.transfer ?? transfer.withdrawal
        numberCardLabel.text = transfer.numberCard
        transferView.backgroundColor = transfer.transferColor ?? transfer.withdrawalColor
        transferImage.image = transfer.transferImage ?? transfer.withdrawalImage
    }
}

//MARK: - Private Extension
private extension InfoCardTableViewCell {
    func setupColors() {
        contentView.backgroundColor = #colorLiteral(red: 0.2472881377, green: 0.2239129543, blue: 0.2614909708, alpha: 1)
    }
    
    func setupViews() {
        contentView.addSubview(backgroundCell)
        backgroundCell.addSubview(transferView)
        backgroundCell.addSubview(transferLabel)
        backgroundCell.addSubview(cashTransferLabel)
        backgroundCell.addSubview(numberCardLabel)
        
        transferView.addSubview(transferImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            backgroundCell.heightAnchor.constraint(equalToConstant: 70),
            
            transferView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            transferView.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 20),
            
            transferView.heightAnchor.constraint(equalToConstant: 40),
            transferView.widthAnchor.constraint(equalToConstant: 40),
            
            transferImage.topAnchor.constraint(equalTo: transferView.topAnchor, constant: 10),
            transferImage.leftAnchor.constraint(equalTo: transferView.leftAnchor, constant: 10),
            transferImage.rightAnchor.constraint(equalTo: transferView.rightAnchor, constant: -10),
            transferImage.bottomAnchor.constraint(equalTo: transferView.bottomAnchor, constant: -10),
            
            transferLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 15),
            transferLabel.leftAnchor.constraint(equalTo: transferView.rightAnchor, constant: 20),
            
            numberCardLabel.topAnchor.constraint(equalTo: transferLabel.topAnchor),
            numberCardLabel.leftAnchor.constraint(equalTo: transferView.rightAnchor, constant: 20),
            numberCardLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -1),
            
            cashTransferLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            cashTransferLabel.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor, constant: -40)
        ])
    }
}
