//
//  ViewController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/04/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {

    
    
    @IBOutlet var loginMailtextField: UITextField!
    @IBOutlet var loginPasswordTextField: UITextField!
    @IBOutlet var signUpMailtextField: UITextField!
    @IBOutlet var signUpUsernametextField: UITextField!
    @IBOutlet var singUpPasswordtextField: UITextField!
    @IBOutlet var signUpPasswordVerificationtextField: UITextField!

   
    
  
    func saveUserData(email: String?, name: String?) {
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        db.collection("users").document(uid ?? "uid:Error").setData([
            "uid": uid ?? "uid:Error",
            "email": email ?? "email:Error",
            "name": name ?? "name:Error",
        ])
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        PasswordSecurity()
        // Do any additional setup after loading the view.
        
        loginMailtextField.text = ""
        loginPasswordTextField.text = ""
        signUpMailtextField.text = ""
        signUpUsernametextField.text = ""
        singUpPasswordtextField.text = ""
        signUpPasswordVerificationtextField.text = ""
        
    }
        
    
    func PasswordSecurity() {
        
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textContentType = .oneTimeCode
        
    }
            
    @IBAction func registerButton() {
            
            let name = signUpUsernametextField.text ?? ""
                let email = signUpMailtextField.text ?? ""
                let password = singUpPasswordtextField.text ?? ""
                let passwordConfirmation = signUpPasswordVerificationtextField.text ?? ""
                
                if (password == passwordConfirmation) {
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                        if (result?.user) != nil {
                            self.saveUserData(email: email, name: name)
                            print("Welcome to Science Lab!")
                            self.performSegue(withIdentifier: "ToTopView", sender: nil)
                        } else {
                            print(error!)
                            
                            
                            
                        }
                    }
                }
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
            }    }




