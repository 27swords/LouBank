//
//  InfoTableViewCell.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 11.10.22.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    //MARK: - Views
    var backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1371092796, green: 0.1377302408, blue: 0.1444591582, alpha: 1)
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var currencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var currencyHeaderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Currencie"
        label.font = UIFont(name: "Helvetica-Light", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var buyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Buy"
        label.font = UIFont(name: "Helvetica-Light", size: 14)
        return label
    }()
    
    var seliLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Seli"
        label.font = UIFont(name: "Helvetica-Light", size: 14)
        return label
    }()
    
    var headerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 80
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var dollarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dollarImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var euroImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "euroImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var dollarView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6964657903, green: 0.8139244914, blue: 0.8080486655, alpha: 1)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var euroView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6964657903, green: 0.8139244914, blue: 0.8080486655, alpha: 1)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var usdLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var euroLabel: UILabel = {
        let label = UILabel()
        label.text = "EUR"
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var buyDollarLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 78.12"
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var seliDollarLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 23.12"
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var buyEuroLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 90.12"
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var seliEuroLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 83.12"
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
        setupColors()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Extension
private extension InfoTableViewCell {
    func setupColors() {
        contentView.backgroundColor = #colorLiteral(red: 0.2456046343, green: 0.2240151465, blue: 0.2640034854, alpha: 1)
    }
    
    func setupViews() {
        contentView.addSubview(backgroundCell)
        
        backgroundCell.addSubview(currencyHeaderLabel)
        backgroundCell.addSubview(headerStackView)
        backgroundCell.addSubview(dollarView)
        backgroundCell.addSubview(euroView)
        backgroundCell.addSubview(usdLabel)
        backgroundCell.addSubview(euroLabel)
        backgroundCell.addSubview(buyDollarLabel)
        backgroundCell.addSubview(seliDollarLabel)
        backgroundCell.addSubview(buyEuroLabel)
        backgroundCell.addSubview(seliEuroLabel)
    
        dollarView.addSubview(dollarImageView)
        euroView.addSubview(euroImageView)
        
        headerStackView.addArrangedSubview(buyLabel)
        headerStackView.addArrangedSubview(seliLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backgroundCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            backgroundCell.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            backgroundCell.heightAnchor.constraint(equalToConstant: 120),
            
            currencyHeaderLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
            currencyHeaderLabel.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 20),
            
            headerStackView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
            headerStackView.leftAnchor.constraint(equalTo: currencyHeaderLabel.rightAnchor),
            headerStackView.rightAnchor.constraint(equalTo: backgroundCell.rightAnchor, constant: -40),
            
            dollarView.topAnchor.constraint(equalTo: currencyHeaderLabel.bottomAnchor, constant: 10),
            dollarView.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 20),
            
            dollarView.heightAnchor.constraint(equalToConstant: 20),
            dollarView.widthAnchor.constraint(equalToConstant: 20),
            
            dollarImageView.topAnchor.constraint(equalTo: dollarView.topAnchor, constant: 2),
            dollarImageView.leftAnchor.constraint(equalTo: dollarView.leftAnchor, constant: 2),
            dollarImageView.rightAnchor.constraint(equalTo: dollarView.rightAnchor, constant: -2),
            dollarImageView.bottomAnchor.constraint(equalTo: dollarView.bottomAnchor, constant: -2),
            
            euroView.topAnchor.constraint(equalTo: dollarImageView.bottomAnchor, constant: 10),
            euroView.leftAnchor.constraint(equalTo: backgroundCell.leftAnchor, constant: 20),

            euroView.widthAnchor.constraint(equalToConstant: 20),
            euroView.heightAnchor.constraint(equalToConstant: 20),
            
            euroImageView.topAnchor.constraint(equalTo: euroView.topAnchor, constant: 4),
            euroImageView.leftAnchor.constraint(equalTo: euroView.leftAnchor, constant: 4),
            euroImageView.rightAnchor.constraint(equalTo: euroView.rightAnchor, constant: -4),
            euroImageView.bottomAnchor.constraint(equalTo: euroView.bottomAnchor, constant: -4),
            
            usdLabel.topAnchor.constraint(equalTo: currencyHeaderLabel.bottomAnchor, constant: 12),
            usdLabel.leftAnchor.constraint(equalTo: dollarImageView.rightAnchor, constant: 12),
            
            euroLabel.topAnchor.constraint(equalTo: usdLabel.bottomAnchor, constant: 12),
            euroLabel.leftAnchor.constraint(equalTo: euroImageView.rightAnchor, constant: 14),
            euroLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -27),
            
            buyDollarLabel.topAnchor.constraint(equalTo: seliLabel.bottomAnchor, constant: 10),
            buyDollarLabel.leftAnchor.constraint(equalTo: usdLabel.rightAnchor, constant: 80),
            
            seliDollarLabel.topAnchor.constraint(equalTo: seliLabel.bottomAnchor, constant: 10),
            seliDollarLabel.leftAnchor.constraint(equalTo: buyDollarLabel.rightAnchor, constant: 56),
            
            buyEuroLabel.topAnchor.constraint(equalTo: buyDollarLabel.bottomAnchor, constant: 12),
            buyEuroLabel.leftAnchor.constraint(equalTo: euroLabel.rightAnchor, constant: 80),
            buyEuroLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -30),
            
            seliEuroLabel.topAnchor.constraint(equalTo: seliDollarLabel.bottomAnchor, constant: 12),
            seliEuroLabel.leftAnchor.constraint(equalTo: buyEuroLabel.rightAnchor, constant: 56),
            seliEuroLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -30)
        ])
    }
}

