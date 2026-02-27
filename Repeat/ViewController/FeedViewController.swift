//
//  ViewController.swift
//  Repeat
//
//  Created by Aleksey on 19.10.2025.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var postViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Feeds ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(showPostViewController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var testViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Feeds ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(showPostViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraints()
    }
    
    private func addConstraints() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(postViewButton)
        stackView.addArrangedSubview(testViewButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showPostViewController() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }

}

