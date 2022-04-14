//
//  RegisterViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-04-07.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.title = "Register"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backHandler))
        // Do any additional setup after loading the view.
    }
    
    
    
    var email: String = ""
    var pwd: String = ""
    var confirmPwd: String = ""
    
    
    @IBOutlet weak var txtEmailField: UITextField!
    
    
    @IBOutlet weak var txtPasswordField: UITextField!
    
    @IBOutlet weak var txtConfirmPasswordField: UITextField!
    
    
    @objc
    func backHandler() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func txtEmailChanged(_ sender: Any) {
        
        email = txtEmailField.text!
    }
    
    
    @IBAction func txtPasswordChanged(_ sender: Any) {
        
        pwd = txtPasswordField.text!
    }
    
    
    @IBAction func txtConfirmPasswordChanged(_ sender: Any) {
        
        confirmPwd = txtConfirmPasswordField.text!
    }
    
    
    
    
    

    @IBOutlet weak var btnRegister: UIButton!
    
    
    @IBAction func btnRegisterTocuhUpInside(_ sender: Any) {
        
        
        guard let username = txtEmailField.text,
              let password = txtPasswordField.text,
              let confirmPassword = txtConfirmPasswordField.text,
              username != "",
              password != "" else {
                  showError(title: "Invalid Information", message: "Please fill in the fields appropriately")
                  return
              }
        
        guard password == confirmPassword else {
            showError(title: "Passwords don't match", message: nil)
            return
        }

        Auth.auth().createUser(withEmail: username, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if error == nil {
                // Success
                            
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                
                strongSelf.present(loginVC, animated: true, completion: nil)
                
            } else {
                // Failure
                strongSelf.showError(title: "Error Registering", message: error?.localizedDescription)
            }
        }
    }
    
   

}
