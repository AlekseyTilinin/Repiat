//
//  ProfileViewController.swift
//  Repeat
//
//  Created by Aleksey on 19.10.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.rowHeight = UITableView.automaticDimension
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        addConstraint()
    }
    
    private func addConstraint() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        publications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let post = publications[indexPath.row]
        
        let postViewModel = PostTableViewCell.Post(
            author: post.author,
            image: post.image,
            description: post.description,
            likes: "Likes: \(post.likes)",
            views: "Views: \(post.views)"
        )
        cell.setup(with: postViewModel)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 250
        }
        return UITableView.automaticDimension
    }
}
