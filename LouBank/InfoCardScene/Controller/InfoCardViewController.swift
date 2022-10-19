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

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .yellow
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

//MARK: - TableView extension
extension InfoCardViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
