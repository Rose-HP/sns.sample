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
    var fromSelectView: Bool = false     // PreviewViewController.swift

    @IBOutlet var saveButton: UIButton!

    @IBAction func SaveDataButton(){
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("users")
                        .document(String(Auth.auth().currentUser?.uid ?? "default"))
              .collection("results")
              .addDocument(data: [
                    "title": titleText,
                    "outline": outlineText,
                    "memo": MemoText
              ]) { err in
                  if let err = err {
                      print("Error writing document: \(err)")
                  } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
                        }
    }
    
    func go2Back(){
        // 2階層前のViewControllerに戻るコード！
        let layer_number = navigationController!.viewControllers.count
        self.navigationController?.popToViewController(navigationController!.viewControllers[layer_number-2], animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleText
        outlineLabel.text = outlineText
        memoLable.text = MemoText
        
        if fromSelectView {
            
            saveButton.isHidden = true
            
            
        }
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
