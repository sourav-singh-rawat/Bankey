//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Sourav Singh Rawat on 04/12/22.
//

import UIKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func onBackPressed()
    func onNextPressed()
    func onDonePressed()
}

class OnboardingViewController: UIViewController {
    
    weak var delegate: OnboardingViewControllerDelegate?
    
    let stackView = UIStackView()
    
    let imageView = UIImageView()
    var imageName: String?
    
    let label = UILabel()
    let labelText: String?
    
    let backButton = UIButton(type: .system)
    
    let nextButton = UIButton(type: .system)
    
    let isFirstPage: Bool
    let isLastPage: Bool
    
    init(
        imageName: String,
        labelText: String,
        isFirstPage: Bool = false,
        isLastPage: Bool = false
    ){
        self.imageName = imageName
        self.labelText = labelText
        
        self.isFirstPage = isFirstPage
        self.isLastPage = isLastPage
        
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
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: [])
        backButton.addTarget(self, action: #selector(onBackPressed), for: .primaryActionTriggered)
        configureBackButton()
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: [])
        nextButton.addTarget(self, action: #selector(onNextPressed), for: .primaryActionTriggered)
        configureNextButton()
    }
    
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 1),
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2)
        ])
    }
    
    
}

//MARK: - Configure
extension OnboardingViewController {
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
    
    private func configureBackButton() {
        if isFirstPage {
            backButton.isHidden = true
        }
    }
    
    private func configureNextButton() {
        if isLastPage {
            nextButton.setTitle("Done", for: [])
        }
    }
}

//MARK: - Action
extension OnboardingViewController {
    @objc func onBackPressed() {
        delegate?.onBackPressed()
    }
    
    @objc func onNextPressed() {
        if isLastPage{
            delegate?.onDonePressed()
        }else {
            delegate?.onNextPressed()
        }
    }
}
