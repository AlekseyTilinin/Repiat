//
//  PostViewController.swift
//  Repeat
//
//  Created by Aleksey on 25.10.2025.
//

import UIKit

class PostViewController: UIViewController {
    
    private lazy var titleLabale: UILabel = {
        let label = UILabel()
        label.text = FeedViewController().post.postTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        addConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(showInfoViewController))
    }
    
    private func addConstraints() {
        view.addSubview(titleLabale)
        
        NSLayoutConstraint.activate([
            titleLabale.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleLabale.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func showInfoViewController() {
        let infoViewController = InfoViewController()
        navigationController?.present(infoViewController, animated: true)
    }
}
