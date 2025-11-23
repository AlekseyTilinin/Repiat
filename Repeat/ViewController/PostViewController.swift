//
//  PostViewController.swift
//  Repeat
//
//  Created by Aleksey on 25.10.2025.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = FeedViewController().post.postTitle
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showInfoViewController))
    }
    
    @objc func showInfoViewController() {
        let infoViewController = InfoViewController()
        navigationController?.present(infoViewController, animated: true)
    }
}
