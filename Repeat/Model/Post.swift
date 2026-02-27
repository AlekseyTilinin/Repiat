//
//  Post.swift
//  Repeat
//
//  Created by Aleksey on 25.10.2025.
//

import UIKit

struct Post {
    var author: String
    var description: String
    var image: UIImage?
    var likes: Int
    var views: Int
}

var publications: [Post] = [
Post(author: "Me", description: "First", image: UIImage(named: "first_image"), likes: 1, views: 1),
Post(author: "Me", description: "Second", image: UIImage(named: "second_image"), likes: 2, views: 2),
Post(author: "Me", description: "Third", image: UIImage(named: "third_image"), likes: 3, views: 3),
Post(author: "Me", description: "Fourth", image: UIImage(named: "fourth_image"), likes: 4, views: 4)
]
