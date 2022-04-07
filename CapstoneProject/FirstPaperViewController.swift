//
//  FirstPaperViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-04-07.
//

import UIKit

class FirstPaperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //manage navigation bar
        //show title
        navigationItem.title = "First Paper"
        //show back button on top left
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButtonPressed))
        
        
        //merge data, generate file
        saveData()
        
        if(checkExist()){
            print("File exists")
            readData()
            
            deleteData()
        }else{
            print("File Not Exist!")
        }
        
        //show data instruction
        dataInstruction()
        
        
        
    }
    
    //press back button: return
    @objc
    func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func secondPaperListButton(_ sender: UIButton) {
        //show 'second paper list' page with navigation bar
        let nextVC=SecondPaperListViewController()
        let navVC=UINavigationController(rootViewController: nextVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
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
