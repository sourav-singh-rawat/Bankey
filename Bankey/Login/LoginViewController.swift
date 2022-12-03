//
//  ViewController.swift
//  Bankey
//
//  Created by Sourav Singh Rawat on 02/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    
    let signInBtn = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
}

extension LoginViewController {
    
    func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        signInBtn.configuration = .filled()
        signInBtn.configuration?.imagePadding = 8
        signInBtn.setTitle("Sign In", for: [])
        signInBtn.addTarget(self, action: #selector(onSignInPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        view.addSubview(loginView)
        view.addSubview(signInBtn)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            signInBtn.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInBtn.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInBtn.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

//MARK: - Actions
extension LoginViewController {
    
    @objc func onSignInPressed(sender: UIButton) {
        
    }
}
