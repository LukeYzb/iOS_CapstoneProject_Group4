//
//  HomeTabsController.swift
//  CapstoneProject
//
//  Created by Sarthak Mahajan on 2022-04-14.
//

import UIKit

class HomeTabsController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVC = FirstPaperViewController();
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
        let groupVC = GrouppageViewController();
        groupVC.tabBarItem = UITabBarItem(title: "Group", image: UIImage.add, tag: 0)
        
        let profileVC = ProfileViewController();
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 0)
        
       
        
        viewControllers = [homeVC, groupVC, profileVC]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
