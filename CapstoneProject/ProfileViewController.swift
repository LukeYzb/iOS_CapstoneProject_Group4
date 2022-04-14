//
//  ProfileViewController.swift
//  CapstoneProject
//
//  Created by Sarthak Mahajan on 2022-04-14.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBAction func editProfileClick(_ sender: Any) {
    
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                
                alert.addAction(UIAlertAction(title: "Pick from Gallery", style: .default, handler: { (button) in
                    self.imagePicker.sourceType = .photoLibrary
                    self.present(self.imagePicker, animated: true, completion: nil)
                }))
                
                alert.addAction(UIAlertAction(title: "Use Camera", style: .default, handler: { (button) in
                    self.imagePicker.sourceType = .camera
                    self.present(self.imagePicker, animated: true, completion: nil)
                }))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        
        profileImage.image = pickedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onChangePasswordClick(_ sender: Any) {
        let vc = ChangePasswordViewController()
        vc.title = "Change Password"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onLogoutClick(_ sender: Any) {
//        do { try Auth.auth().signOut() }
//            catch { print("already logged out") }
//
//            navigationController?.popToRootViewController(animated: true)
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
