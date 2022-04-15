//
//  ResultViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-04-13.
//

import UIKit

class ResultViewController: UIViewController {
   
    var selectedSecondPaper:SecondPaperList? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func homePageButtom(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)}
    
    @IBAction func onAnotherPageSelected(_ sender: UIButton) {
         navigationController?.popViewController(animated: true)
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
