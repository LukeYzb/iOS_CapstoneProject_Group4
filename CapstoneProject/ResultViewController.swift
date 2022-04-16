//
//  ResultViewController.swift
//  CapstoneProject
//
//  Created by 志斌Zhibin 于Yu on 2022-04-13.
//

import UIKit

class ResultViewController: UIViewController {
   
    var mergedPeperData:MergedFile? = nil;
    
    //result file name
    var resultName = ""
    
    //first paper content and second paper content
    var file1:String = ""
    var file2:String = ""
    
    @IBOutlet weak var resultPaperTextView: UITextView!
    @IBOutlet weak var resultPaperNameLabel: UILabel!
    @IBOutlet weak var instructionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultName = mergedPeperData?.finalFileName ?? "";
        file1 = mergedPeperData?.firstPageContent ?? "";
        file2 = mergedPeperData?.secondPageContent ?? "";
        resultPaperNameLabel.text = resultName;
        resultPaperTextView.text = file1 + " " + file2;
        
        
        // Do any additional setup after loading the view.
        
        //merge data, generate file
        saveData(str1: file1,str2: file2)
        if(checkExist()){
            print("File exists")
            readData()
            
            //deleteData()
        }else{
            print("File Not Exist!")
        }
        
        //show data instruction
        let instruction:String = dataInstruction()
        instructionTextView.text = instruction
        
        //show result paper name
        resultPaperNameLabel.text = resultName
        
        //show result
        resultPaperTextView.text = merge(str1: file1, str2: file2)
        
    }
    
    //close virtual keyboard while clicking outside of text field
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        resultPaperTextView.resignFirstResponder()
        instructionTextView.resignFirstResponder()
    }

    @IBAction func homePageButtom(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        //navigationController?.popToRootViewController(animated: true)
        
    }
    
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
