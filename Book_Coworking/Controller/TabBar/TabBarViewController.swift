//
//  TabBarViewController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/4/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBar()
    }
    
    func setUpTabBar() {
        
        let homeVC = HomeViewController()
        let navHome = UINavigationController(rootViewController: homeVC)
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let listCoworkingVC = ListCoworkingViewController()
        let navListCoworking = UINavigationController(rootViewController: listCoworkingVC)
        navListCoworking.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"))
        
        let profileVC = ProfileViewController()
        let navProfile = UINavigationController(rootViewController: profileVC)
        navProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        UITabBar.appearance().tintColor = UIColor().mainColor()
        setViewControllers([navHome, navListCoworking, navProfile], animated: true)
        
    }
    
}
