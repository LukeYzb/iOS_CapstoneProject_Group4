//
//  ChatViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-03-18.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var chatsArray: [Chat] = [
        Chat(time: "13:45", content: "Capstone project sketch")
    ]
    
    @IBOutlet weak var timeTextView: UITextView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //manage navigation bar
        //show title
        navigationItem.title = "Chat Plan"
        //show back button on top left
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButtonPressed))
        //show add button on top right
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLike))
        
        //set tableview
        tableView.delegate=self
        tableView.dataSource=self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        
    }
    
    //close virtual keyboard while clicking outside of text field
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        timeTextView.resignFirstResponder()
        contentTextView.resignFirstResponder()
    }

    //press back button: return
    @objc
    func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    //press add button: add a new laptop
    @objc
    func addLike() {
        if timeTextView.text==nil||timeTextView.text==""{
            //show time empty alert
            let alertController = UIAlertController(title: "Time is Empty!", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }else if contentTextView.text==nil||contentTextView.text==""{
            //show content empty alert
            let alertController = UIAlertController(title: "Content is Empty!", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }else{
            chatsArray.append(Chat(time: timeTextView.text, content: contentTextView.text))
            //clear textview
            timeTextView.text=""
            contentTextView.text=""
        }
        
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatTableViewCell
        
        cell.timeLabel.text=chatsArray[indexPath.row].time
        cell.contentLabel.text=chatsArray[indexPath.row].content
        
        return cell
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
