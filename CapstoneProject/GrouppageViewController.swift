//
//  GrouppageViewController.swift
//  CapstoneProject
//
//  Created by Manan on 15/04/22.
//

import UIKit

class GrouppageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func grouppage(_ sender: Any) {
        let nextVC = JoingroupViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func Personalpage(_ sender: Any) {
        let nextVC = PersonalpageViewController()
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
