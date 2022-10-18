//
//  HomeViewController.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 29.09.22.
//

import UIKit
 
final class HomeViewController: UIViewController {
    
    //MARK: - Views
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        return view
    }()
        
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = contentSize
        scrollView.frame = view.bounds
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 100)
    }
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.image = UIImage(named: "AvatarImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш баланс"
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var moneyBalanceLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 6,543"
        label.textColor = .white
        label.font = UIFont(name:"Helvetica-Bold", size: 28.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var balanceStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SearchButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var financeLabel: UILabel = {
        let label = UILabel()
        label.text = "Финансы"
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - CollectionVeiws
    private let cardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let financeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: -  TableView
    private let infoTableView: UITableView = {
        let view = UITableView()
        view.layer.cornerRadius = 24
        view.backgroundColor = #colorLiteral(red: 0.2456046343, green: 0.2240151465, blue: 0.2640034854, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Inits
    var cards: CardModel = CardModel()
    var finance: FinanceModel = FinanceModel()
    var currency: СurrencyModel = СurrencyModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupCollectionViews()
        setupTableView()
        configureTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImage.makeRounded()
        
        backgroundView.applyGradient(colors: [#colorLiteral(red: 0.2338522673, green: 0.2122679353, blue: 0.25224787, alpha: 1).cgColor, #colorLiteral(red: 0.1215686426, green: 0.1215686426, blue: 0.1215686426, alpha: 1).cgColor],
                                     startPoint: CGPoint(x: 1, y: 0),
                                     endPoint: CGPoint(x: 0, y: 1))
    }
}

//MARK: - Extensions CollectionView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cardCollectionView {
            return cards.card.count
        } else {
            return finance.finance.count
        } 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cardCollectionView {
            let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardsCollectionViewCell
            
            let cards = cards.card[indexPath.item]
            
            cardCell?.configureCellCard(card: cards)
            return cardCell ?? UICollectionViewCell()
        } else {
            let financeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FinanceCell", for: indexPath) as? FinanceCollectionViewCell
            
            let finance = finance.finance[indexPath.item]
            
            financeCell?.configureCellFinance(finance: finance)
            return financeCell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cardCollectionView {
            return CGSize(width: 160, height: 200)
        } else {
            return CGSize(width: 110, height: 110)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == cardCollectionView {
            return 15
        } else {
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == cardCollectionView {
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        } else {
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
    }
}

//MARK: - Extensions TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "СurrencyCell", for: indexPath) as? СurrencyTableViewCell
        else {
            return UITableViewCell()
        }
        let currency = currency.сurrency[indexPath.row]
        
        cell.configureCellCurrency(currency: currency)
        return cell
    }
}

//MARK: - Private Extension
private extension HomeViewController {
    func setupCollectionViews() {
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        financeCollectionView.delegate = self
        financeCollectionView.dataSource = self
        
        cardCollectionView.register(CardsCollectionViewCell.self, forCellWithReuseIdentifier: "CardCell")
        cardCollectionView.register(AddCardCollectionViewCell.self, forCellWithReuseIdentifier: "AddCardCell")
        financeCollectionView.register(FinanceCollectionViewCell.self, forCellWithReuseIdentifier: "FinanceCell")
    }
    
    func setupTableView() {
        infoTableView.rowHeight = UITableView.automaticDimension
        infoTableView.separatorStyle = .none
        infoTableView.register(СurrencyTableViewCell.self, forCellReuseIdentifier: "СurrencyCell")
        infoTableView.delegate = self
        infoTableView.dataSource = self
    }
    
    func configureTabBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(backgroundView)
        
        backgroundView.addSubview(balanceStackView)
        backgroundView.addSubview(avatarImage)
        backgroundView.addSubview(searchButton)
        backgroundView.addSubview(cardCollectionView)
        backgroundView.addSubview(financeCollectionView)
        backgroundView.addSubview(financeLabel)
        backgroundView.addSubview(infoTableView)
        
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(moneyBalanceLabel)
    }
    
    //MARK: - Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            avatarImage.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 50),
            avatarImage.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 15),
            
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 50),
            
            balanceStackView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 30),
            balanceStackView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            
            searchButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 150),
            searchButton.leftAnchor.constraint(equalTo: balanceStackView.rightAnchor),
            searchButton.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -30),
            
            searchButton.widthAnchor.constraint(equalToConstant: 30),
            searchButton.heightAnchor.constraint(equalToConstant: 30),
            
            cardCollectionView.topAnchor.constraint(equalTo: balanceStackView.bottomAnchor, constant: 30),
            cardCollectionView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            cardCollectionView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            
            cardCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            financeLabel.topAnchor.constraint(equalTo: cardCollectionView.bottomAnchor, constant: 30),
            financeLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            financeLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            
            financeCollectionView.topAnchor.constraint(equalTo: financeLabel.bottomAnchor, constant: 10),
            financeCollectionView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            financeCollectionView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),

            financeCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            infoTableView.topAnchor.constraint(equalTo: financeCollectionView.bottomAnchor, constant: 30),
            infoTableView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            infoTableView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
        ])
    }
}
