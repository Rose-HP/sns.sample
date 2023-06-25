//
//  LoginViewController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/05/14.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet var loginMailtextField: UITextField!
    @IBOutlet var loginPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginMailtextField.text = ""
        loginPasswordTextField.text = ""
        
    }
        
        @IBAction func loginButton() {
            let email = loginMailtextField.text ?? ""
            let password = loginPasswordTextField.text ?? ""
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if (result?.user) != nil {
                    self.performSegue(withIdentifier: "ToTopView", sender: nil)
                } else {
                    print(error!)
                    
                }
                
            }
            
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


