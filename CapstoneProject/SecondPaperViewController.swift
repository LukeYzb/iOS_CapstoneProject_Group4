//
//  SecondPaperViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-04-07.
//

import UIKit


protocol AddSecondPaperDelegate {
    func addSecondPaper(secondPaper: SecondPaperList)
}


class SecondPaperViewController: UIViewController {
    var delegate: AddSecondPaperDelegate?
    @IBOutlet weak var secondPaperName: UITextField!
    @IBOutlet weak var secondPaper: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //manage navigation bar
        //show title
        navigationItem.title = "Add Second Paper"
        //show back button on top left
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButtonPressed))
    }
    
    //press back button: return
    @objc
    func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onAddButtonClicked(_ sender: Any) {
        let dateFormatter : DateFormatter = DateFormatter()
        //  dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.dateFormat = "HH:mm"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        
        delegate?.addSecondPaper(secondPaper: SecondPaperList(time:dateString , name: secondPaperName.text ?? "" , content: secondPaper.text))
        
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
