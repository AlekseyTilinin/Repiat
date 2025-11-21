//
//  ProfileViewController.swift
//  Repeat
//
//  Created by Aleksey on 19.10.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .lightGray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(profileHeaderView)
        profileHeaderView.frame = view.frame
    }

}
