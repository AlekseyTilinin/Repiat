//
//  ProfileHeaderView.swift
//  Repeat
//
//  Created by Aleksey on 21.11.2025.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var profileImageName: String = ""
    
    private lazy var profileNameText: String = "Hipster Cat"
    
    private lazy var statusText: String = ""
    
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: profileImageName)
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 75
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var profileName: UILabel = {
        let name = UILabel()
        name.text = profileNameText
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var profileStatus: UILabel = {
        let status = UILabel()
        status.text = "Hello! I'm \(profileName.text ?? "Guess")"
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.placeholder = "Сreate your status..."
        textField.clearButtonMode = .whileEditing
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraint() {
        
        addSubview(profileImage)
        addSubview(profileName)
        addSubview(profileStatus)
        addSubview(statusTextField)
        addSubview(showStatusButton)
        
                NSLayoutConstraint.activate([
                    profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
                    profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                    profileImage.widthAnchor.constraint(equalToConstant: 150),
                    profileImage.heightAnchor.constraint(equalToConstant: 150),
                    
                    profileName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
                    profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
                    
                    profileStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
                    profileStatus.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 16),
                    
                    statusTextField.topAnchor.constraint(equalTo: profileStatus.bottomAnchor, constant: 16),
                    statusTextField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
                    statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                    statusTextField.heightAnchor.constraint(equalToConstant: 40),
                    
                    showStatusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
                    showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                    showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                    showStatusButton.heightAnchor.constraint(equalToConstant: 50)
                ])
    }
}
