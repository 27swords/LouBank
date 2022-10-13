//
//  LoginController.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 27.09.22.
//

import UIKit

final class LoginController: UIViewController {
    
    //MARK: - Views
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LouBank")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name:"Helvetica", size: 18.0)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(buttonSegue), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var becomeClientButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.2121548057, green: 0.1991604567, blue: 0.2292257249, alpha: 1)
        button.layer.cornerRadius = 24
        button.titleLabel?.font = UIFont(name:"Helvetica-Bold", size: 16.0)
        button.setTitle("Стать клиентом банка", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
        logInButton.applyGradient(colors: [#colorLiteral(red: 0.9767410159, green: 0.9885960221, blue: 0.8214097619, alpha: 1).cgColor, #colorLiteral(red: 0.9411759973, green: 0.9757811427, blue: 0.543342948, alpha: 1).cgColor],
                                  startPoint: CGPoint(x: 0, y: 0),
                                  endPoint: CGPoint(x: 0, y: 1))
        
        backgroundView.applyGradient(colors: [#colorLiteral(red: 0.2338522673, green: 0.2122679353, blue: 0.25224787, alpha: 1).cgColor, #colorLiteral(red: 0.1220309511, green: 0.1258143485, blue: 0.1325757205, alpha: 1).cgColor],
                                     startPoint: CGPoint(x: 0, y: 0),
                                     endPoint: CGPoint(x: 0, y: 1))
        
    }
    
    //MARK: - Objc methods
    @objc func buttonSegue() {
        let vc = TabBarViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Private Extension
private extension LoginController {
    func setupViews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(logoImageView)
        backgroundView.addSubview(logInButton)
        backgroundView.addSubview(becomeClientButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: -180),
            logoImageView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 142),
            logoImageView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -142),

            logInButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -110),
            logInButton.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 30),
            logInButton.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -30),
            
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            
            becomeClientButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20),
            becomeClientButton.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 30),
            becomeClientButton.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -30),
            becomeClientButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -300),
            
            becomeClientButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
