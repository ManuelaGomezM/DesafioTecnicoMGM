//
//  TabBarManager.swift
//  ChallengeTecnico1
//
//  Created by Manuela on 28/05/2024.
//

import UIKit

class TabBarManager: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let newsVC = UINavigationController(rootViewController: NewsViewController())
        newsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 0)

        let usersVC = UINavigationController(rootViewController: UsersViewController())
        usersVC.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person.3"), tag: 1)

        viewControllers = [newsVC, usersVC]
    }
}
