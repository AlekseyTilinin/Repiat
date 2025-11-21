//
//  ViewController.swift
//  Repeat
//
//  Created by Aleksey on 19.10.2025.
//

import UIKit

class FeedViewController: UIViewController {

    
    var post = Post(postTitle: "Post")
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraints()
    }
    
    private func addConstraints() {
        view.addSubview(postViewButton)
        
        NSLayoutConstraint.activate([
            postViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showPostViewController() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }

}

