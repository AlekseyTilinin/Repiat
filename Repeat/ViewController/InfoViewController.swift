//
//  InfoViewController.swift
//  Repeat
//
//  Created by Aleksey on 25.10.2025.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton:UIButton = {
        let button = UIButton()
        button.setTitle(" Alert ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let alertController = UIAlertController(title: "Alert", message: "Alert?", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        addConstraints()
        setupAlertCinfiguration()
    }
 
    private func addConstraints() {
        
        view.addSubview(alertButton)
        
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupAlertCinfiguration() {
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            print("OK")
        }))
        alertController.addAction(UIAlertAction(title: "Cool", style: .default, handler: {_ in
            print("Cool")
        }))
    }
    
    @objc func showAlert() {
        self.present(alertController, animated: true, completion: nil)
    }
}
