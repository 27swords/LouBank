//
//  TabBarViewController.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 29.09.22.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        makeTabItems()
    }
}
//MARK: - Private Extensions
private extension TabBarViewController {
    
    func setupTabBar() {
        tabBar.backgroundColor = #colorLiteral(red: 0.1333333254, green: 0.1333333254, blue: 0.1333333254, alpha: 1)
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.9443746209, green: 0.9760175347, blue: 0.5466615558, alpha: 1)
        tabBar.layer.cornerRadius = 12
    }
        
    func makeTabItems() {
        let home = HomeViewController()
        let myCards = MyCardController()
        let budget = BudgetController()
        let chat = ChatController()
        
        guard let homeIcon = UIImage(named: "HomeIcon") else { return }
        guard let myCardIcon = UIImage(named: "MyCardIcon") else { return }
        guard let bydgetIcon = UIImage(named: "BudgetIcon") else { return }
        guard let chatIcon = UIImage(named: "ChatIcon") else { return }
        
        let homeScene = createNavController(for: home, title: "", image: homeIcon)
        let myCardScene = createNavController(for: myCards, title: "", image: myCardIcon)
        let budgetScene = createNavController(for: budget, title: "", image: bydgetIcon)
        let chatSceme = createNavController(for: chat, title: "", image: chatIcon)
        
        viewControllers = [homeScene, budgetScene, myCardScene, chatSceme]
    }
    
    func createNavController(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage?
    ) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.tabBarItem.title = title
        return navController
    }
}
