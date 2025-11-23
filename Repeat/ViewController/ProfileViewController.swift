//
//  ProfileViewController.swift
//  Repeat
//
//  Created by Aleksey on 19.10.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView = {
        let header = ProfileHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private lazy var changeTitleButton = {
        let button = UIButton()
        button.setTitle("Change title", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .lightGray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        addConstraint()
    }
    
    private func addConstraint() {
        view.addSubview(profileHeaderView)
        view.addSubview(changeTitleButton)
        
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 250),
            
            changeTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            changeTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            changeTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
