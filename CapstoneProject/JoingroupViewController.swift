//
//  JoingroupViewController.swift
//  CapstoneProject
//
//  Created by Manan on 15/04/22.
//

import UIKit

class JoingroupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tempuser(_ sender: Any) {
        let nextVC = TemplateViewController()
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
