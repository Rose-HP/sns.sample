//
//  MemoViewController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/05/28.
//

import UIKit

class MemoViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contextTextView: UITextView!

    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = saveData.object(forKey: "title") as? String

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveMemo(_ sender: Any) {
        
        
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
