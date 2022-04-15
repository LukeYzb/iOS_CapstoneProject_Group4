//
//  FirstPaperViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-04-07.
//

import UIKit

protocol FirstPaperDelegate {
    func addFirstPaper(resultPaperName: String, firstPaperContent: String)
}

class FirstPaperViewController: UIViewController {
    var delegate: FirstPaperDelegate?

    @IBOutlet weak var resultPaperNameTextField: UITextField!
    @IBOutlet weak var firstPaperContentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //manage navigation bar
        //show title
        navigationItem.title = "First Paper"
        //show back button on top left
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButtonPressed))
        
    }
    
    //close virtual keyboard while clicking outside of text field
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        resultPaperNameTextField.resignFirstResponder()
        firstPaperContentTextField.resignFirstResponder()
    }
    
    //press back button: return
    @objc
    func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func secondPaperListButton(_ sender: UIButton) {
        delegate?.addFirstPaper(resultPaperName: resultPaperNameTextField.text!, firstPaperContent: firstPaperContentTextField.text!)
        
        //show 'second paper list' page with navigation bar
        let nextVC=SecondPaperListViewController()
        navigationController?.pushViewController(nextVC, animated: true)
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
