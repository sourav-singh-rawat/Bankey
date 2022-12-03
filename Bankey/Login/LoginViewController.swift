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
    
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
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
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    func layout() {
        view.addSubview(loginView)
        view.addSubview(signInBtn)
        view.addSubview(errorMessageLabel)
        
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
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInBtn.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

//MARK: - Actions
extension LoginViewController {
    
    @objc func onSignInPressed(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Password should not be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureErrorView(withMessage: "Username / Password should not be blank")
            return
        }
        
        if username == "123" && password == "123" {
            signInBtn.configuration?.showsActivityIndicator = true
            return
        } else {
            configureErrorView(withMessage: "Username / Password is not correct")
            return
        }
        
    }
    
    private func configureErrorView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
