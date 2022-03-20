//
//  ViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-03-18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func chatPlanButton(_ sender: UIButton) {
        //show chat plan page with navigation bar
        let nextVC=ChatViewController()
        let navVC=UINavigationController(rootViewController: nextVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    @IBAction func contactListButton(_ sender: UIButton) {
        //show contact list page with navigation bar
        let nextVC=ContactListViewController()
        let navVC=UINavigationController(rootViewController: nextVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
}

