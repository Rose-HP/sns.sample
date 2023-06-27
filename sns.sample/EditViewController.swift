//
//  EditViewController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/06/25.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var outlineTextField: UITextField!
    @IBOutlet weak var MemoTextView: UITextView!
    
    
    var saveData: UserDefaults = UserDefaults.standard
    
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titleTextField.text = saveData.object(forKey: "title") as? String
        outlineTextField.text = saveData.object(forKey: "outline") as? String
        MemoTextView.text = saveData.object(forKey: "content") as? String
        // Do any additional setup after loading the view.
    }
    
    @IBAction func previewButton(_ sender:Any){
        
        
        
        self.performSegue(withIdentifier: "ToPreview", sender: nil)
        
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(outlineTextField.text, forKey: "outline")
        saveData.set(MemoTextView.text, forKey: "content")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPreview"
        {
            let nextVC = segue.destination as! PreviewViewController
            nextVC.titleText = titleTextField.text
            nextVC.outlineText = outlineTextField.text
            nextVC.MemoText = MemoTextView.text
        }
        
    }
    
    @IBAction func uploadButton(_ sender:Any){
        
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
