//
//  ChangePasswordViewController.swift
//  CapstoneProject
//
//  Created by Sarthak Mahajan on 2022-04-14.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onChangePasswordClick(_ sender: Any) {
        guard let password = passwordTextField.text,
              let confirmPassword = confirmPasswordTextField.text else {
                  return
              }
        
        if (password != confirmPassword) {
            let alertController = UIAlertController(title: "Error", message: "Passwords do not match. Please try again", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        
//        Auth.auth().currentUser?.updatePassword(to: password) { error in
//          // ...
//        }
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
