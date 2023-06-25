//
//  HomeController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/05/14.
//

import Foundation
import UIKit
import FirebaseAuth

class HomeController: UIViewController {
    
    
    
    // UIButtonのアクションメソッド
    @IBAction func goToNextScreen(_ sender: UIButton) {
        // 次の画面のViewControllerのインスタンスを生成
        
        // 画面をプッシュ
        
        
        
        let alert: UIAlertController = UIAlertController(title: "Logout", message: "You sure want to Log out?", preferredStyle: .alert)
        
       
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in let NextVC = StartViewController()
            do {
                try Auth.auth().signOut()
                self.dismiss(animated: true, completion: nil)
            } catch let error as NSError {
                print(error)
            }
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            // OKボタンが押された時の処理
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in }
            // Cancelボタンが押された時の処理
        
            
        ))
        self.present(alert, animated: true, completion: nil)
        
    
    }
    
}

