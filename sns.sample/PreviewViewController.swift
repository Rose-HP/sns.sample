//
//  PreviewViewController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/06/25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class PreviewViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet  var outlineLabel: UILabel!
    @IBOutlet var memoLable: UILabel!
    @IBOutlet var username: UILabel!
    
    var titleText: String? = ""
    var outlineText: String? = ""
    var MemoText: String? = ""
    
    
    @IBAction func SaveDataButton(_ sender:Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleText
        outlineLabel.text = outlineText
        memoLable.text = MemoText
        
        

        // Do any additional setup after loading the view.
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
