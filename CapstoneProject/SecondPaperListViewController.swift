//
//  SecondPaperListViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-04-07.
//

import UIKit

class SecondPaperListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var secondPaperArray: [SecondPaperList] = [
        SecondPaperList(time: "17:41", name: "Zhibin Yu",content: "")
    ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //manage navigation bar
        //show title
        navigationItem.title = "Second Paper List"
        //show back button on top left
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButtonPressed))
        
        //set tableview
        tableView.delegate=self
        tableView.dataSource=self
        tableView.register(UINib(nibName: "SecondPaperListTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondPaperCell")
        
    }
    
    //press back button: return
    @objc
    func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondPaperArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondPaperCell", for: indexPath) as! SecondPaperListTableViewCell
        
        cell.nameLabel.text=secondPaperArray[indexPath.row].name
        cell.timeLabel.text=secondPaperArray[indexPath.row].time
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let resultViewController = ResultViewController()
        resultViewController.selectedSecondPaper = secondPaperArray[indexPath.row];
        navigationController?.pushViewController(resultViewController, animated: true)
        
    }
    
    @IBAction func addSecondPaperButton(_ sender: UIButton) {
        //show 'add second paper' page with navigation bar
//        let nextVC=SecondPaperViewController()
//        let navVC=UINavigationController(rootViewController: nextVC)
//        navVC.modalPresentationStyle = .fullScreen
//        present(navVC, animated: true, completion: nil)
//
//
        
        let controller = SecondPaperViewController()
        controller.delegate = self
        
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
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
extension SecondPaperListViewController: AddSecondPaperDelegate {
    
    func addSecondPaper(secondPaper: SecondPaperList) {
        self.dismiss(animated: true) {
            print("hello");
            self.secondPaperArray.append(secondPaper)
            self.tableView.reloadData()
        }
    }
}
