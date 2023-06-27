//
//  HomeController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/05/14.
//

import Foundation
import UIKit
import FirebaseAuth
import AVFoundation

class HomeController: UIViewController, UIImagePickerControllerDelegate, UIImagePickerController, UINavigationControllerDelegate {
    
    
    
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
    
    
    @IBAction func startUiImagePickerController(_ sender: Any) {
           let picker = UIImagePickerController()
           picker.sourceType = .camera
           picker.delegate = self
           // UIImagePickerController カメラを起動する
           present(picker, animated: true, completion: nil)
       }

       /// シャッターボタンを押下した際、確認メニューに切り替わる
       /// - Parameters:
       ///   - picker: ピッカー
       ///   - info: 写真情報
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        // "写真を使用"を押下した際、写真アプリに保存する
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        // UIImagePickerController カメラが閉じる
        self.dismiss(animated: true, completion: nil)
        
    }
}

