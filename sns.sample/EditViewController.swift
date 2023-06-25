//
//  EditViewController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/06/25.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBAction func previewButton(_ sender:Any){
        
        self.performSegue(withIdentifier: "ToPreview", sender: nil)
    }
    
    @IBAction func uploadButton(_ sender:Any){
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
