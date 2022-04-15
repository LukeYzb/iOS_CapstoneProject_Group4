//
//  ViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-03-18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //close virtual keyboard while clicking outside of text field
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwdTextField.resignFirstResponder()
    }

    @IBAction func startMergingButton(_ sender: UIButton) {
        //show 'first paper' page with navigation bar
        let nextVC=HomeTabsController()
        let navVC=UINavigationController(rootViewController: nextVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        //show 'register' page with navigation bar
        let nextVC=RegisterViewController()
        let navVC=UINavigationController(rootViewController: nextVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    
}

