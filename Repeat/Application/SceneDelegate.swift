//
//  SceneDelegate.swift
//  Repeat
//
//  Created by Aleksey on 19.10.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    //Создаем два навигационных контроллера, которые будут служить иерархическим представлением, для ечеек таббара.
    var firstTabNavigationController: UINavigationController!
    var secondTabNavigationController: UINavigationController!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        
        firstTabNavigationController = UINavigationController.init(rootViewController: FeedViewController())
        secondTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())
        
        tabBarController.viewControllers = [firstTabNavigationController, secondTabNavigationController]
        
        let item1 = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 1)
        let item2 = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 2)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2
        
        UITabBar.appearance().tintColor = .purple
        UITabBar.appearance().backgroundColor = .systemBackground
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

