//
//  MyCardController.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 29.09.22.
//

import UIKit

class MyCardController: UIViewController {
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = #colorLiteral(red: 0.2472881377, green: 0.2239129543, blue: 0.2614909708, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var myCard: CardModel = CardModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationVC()
        setupViews()
        setupConstraints()
    }
}

extension MyCardController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCard.card.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MyCardTableViewCell
        else {
            return UITableViewCell()
        }
        let mycard = myCard.card[indexPath.row]
        
        cell.configureCellMyCard(myCard: mycard)
        
        return cell
    }
}

private extension MyCardController {
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(MyCardTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupNavigationVC() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let addCard = UIBarButtonItem(title: "Добавить",
                                      style: .plain,
                                      target: self,
                                      action: nil)
        
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        title = "Платежи"
        navigationItem.rightBarButtonItem = addCard
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        navigationItem.setRightBarButton(addCard, animated: true)
    }
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints () {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
