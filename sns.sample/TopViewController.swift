//
//  TopViewController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/05/13.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class TopViewController: UIViewController {
    
    @IBOutlet var loginMailLabel: UILabel!
    @IBOutlet var loginUsernameLabel: UILabel!
    
    var loginMailtext = ""
    var loginUsernametext = ""
    
    var uid = Auth.auth().currentUser?.uid
    var listener: ListenerRegistration?
    
    func readUserData(uid: String) {
        let db = Firestore.firestore()
        listener = db.collection("users").whereField("uid", isEqualTo: uid).addSnapshotListener { (documentSnapshot, error) in
            if let error = error {
                print("Error!:", error)
            } else {
                print("success!")
                if let documentSnapshots = documentSnapshot?.documents {
                    for document in documentSnapshots {
                        let data = document.data()
                        self.loginUsernametext = data["name"] as? String ?? "Name:Error"
                        self.loginUsernameLabel.text = self.loginUsernametext
                    }
                }
            }
        }
    }
            override func viewDidLoad() {
        super.viewDidLoad()
        
        readUserData(uid: uid ?? "uid:Error")
        
        loginMailtext = Auth.auth().currentUser?.email ?? "error"
        loginMailtext += "is in Science Lab"
        loginMailLabel.text = loginMailtext
    }
    
    @IBAction func logoutButton() {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print(error)
        }
    }
    
    
                        
                    
                }
            
        
