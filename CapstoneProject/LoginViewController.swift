//
//  LoginViewController.swift
//  CapstoneProject
//
//  Created by Manan on 14/04/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    
    @IBOutlet weak var txtPwd: UITextField!
    
    
    @IBAction func txtEmailChanged(_ sender: Any) {
    }
    
    @IBAction func txtPwdChanged(_ sender: Any) {
    }
    
    
    
    var email: String = ""
    var pwd: String = ""
    
    
    @IBAction func btnLoginTouchUpInsider(_ sender: Any) {
        
        guard let login = txtEmail.text,
              let password = txtPwd.text else {
                  return
              }
        
        Auth.auth().signIn(withEmail: login, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            
            if error == nil {
                // Success
               // strongSelf.showMainScreen()
            } else {
                // Failure
                strongSelf.showError(title: "Incorrect Login or password", message: error?.localizedDescription)
            }
            
        }
        
    }
   
    
    
    @IBAction func btnRegisterTouchUpInside(_ sender: Any) {
        
        let registerVC = RegisterViewController()
        
        let navVC = UINavigationController(rootViewController: registerVC)
        
        navVC.modalPresentationStyle = .fullScreen
        
        present(navVC, animated: true, completion: nil)
        
    }
    
    
    
}

extension UIViewController {
    func showError(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
