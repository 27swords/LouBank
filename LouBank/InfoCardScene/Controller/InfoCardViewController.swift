//
//  InfoCardViewController.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 18.10.22.
//

import UIKit

final class InfoCardViewController: UIViewController {

    //MARK: - Views
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .clear
        control.tintColor = .gray
        control.currentPageIndicatorTintColor = #colorLiteral(red: 0.7224219441, green: 0.7664391398, blue: 0.3638426065, alpha: 1)
        return control
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Inits
    var cardId: CardModel = CardModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupCollectionView()
        setupTableView()
        setupNavigationVC()
        configurePageControl()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.applyGradient(colors: [#colorLiteral(red: 0.2338522673, green: 0.2122679353, blue: 0.25224787, alpha: 1).cgColor, #colorLiteral(red: 0.1215686426, green: 0.1215686426, blue: 0.1215686426, alpha: 1).cgColor],
                                     startPoint: CGPoint(x: 1, y: 0),
                                     endPoint: CGPoint(x: 0, y: 1))
    }
}

//MARK: - CollectionView extension
extension InfoCardViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardId.card.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? InfoCardCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        let cards = cardId.card[indexPath.row]

        cell.configureCellCard(card: cards)
        
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
            
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}

//MARK: - TableView extension
extension InfoCardViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? InfoCardTableViewCell
        else {
            return UITableViewCell()
        }
        return cell
    }
}

//MARK: - Private extension
private extension InfoCardViewController {
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(InfoCardCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(InfoCardTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func setupNavigationVC() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        title = "Ваши карты"
    }

    func setupViews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(collectionView)
        backgroundView.addSubview(pageControl)
        backgroundView.addSubview(tableView)
    }
    
    func configurePageControl() {
        pageControl.currentPage = 0
        pageControl.numberOfPages = cardId.card.count
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 100),
            collectionView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: 250),
            
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            pageControl.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            pageControl.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            
            tableView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 30),
            tableView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
        ])
    }
}
