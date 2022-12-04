//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Sourav Singh Rawat on 04/12/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    
    let imageView = UIImageView()
    var imageName: String?
    
    let label = UILabel()
    let labelText: String?
    
    init(imageName:String,labelText:String){
        self.imageName = imageName
        self.labelText = labelText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        style()
        layout()
    }
    
}

extension OnboardingViewController {
    
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        configureImageView()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.textAlignment = .center
        configureLabel()
    }
    
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
    
    private func configureImageView() {
        guard let imageName = self.imageName else {
            assertionFailure("Image name can't be nil")
            return
        }
        
        imageView.image = UIImage(named: imageName)
    }
    
    private func configureLabel(){
        guard let labelText = self.labelText else {
            assertionFailure("Label text can't be nil")
            return
        }
        
        label.text = labelText
    }
}
