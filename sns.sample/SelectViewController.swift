//
//  SelectViewController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/06/25.
//



// この下にUITableViewDelegateを追加したよ！

//
//  SelectViewController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/06/25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

// この下にUITableViewDelegateを追加したよ！
class SelectViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBAction func addStudy(_ sender: Any) {
    }
    
    @IBOutlet var table: UITableView!
    
    var studyNameArray = [String]()
    
    var nameArray: [String] = [""]
    var outlineArray: [String] = [""]
    var memoArray: [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self //このコードを追加！
        
        let db = Firestore.firestore()
        nameArray = [] // 再度取得する際に前のデータを一旦無くすため
        outlineArray = [] // 再度取得する際に前のデータを一旦無くすため
        memoArray = [] // 再度取得する際に前のデータを一旦無くすため
        db.collection("users")
            .document(String(Auth.auth().currentUser?.uid ?? "default"))
            .collection("results")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        // 取得したドキュメントごとに実行する
                        print("\(document.documentID) => \(document.data())")
                        let data = document.data()
                        self.nameArray.append(data["title"] as? String ?? "Title:Error") // TableViewに表示＋(選ばれたら)遷移先に送信
                        self.outlineArray.append(data["outline"] as? String ?? "Outline:Error") // TableViewに表示＋(選ばれたら)遷移先に送信
                        self.memoArray.append(data["memo"] as? String ?? "Memo:Error") // (選ばれたら)遷移先に送信
                    }
                    self.table.reloadData() // ドキュメント取得後にTableViewに反映させるため
                }
            }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return nameArray.count // 配列に含まれているデータの数だけセルを作る！
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseIdentifier")
        }
        
        cell?.textLabel?.text = nameArray[indexPath.row]
        cell?.detailTextLabel?.text = outlineArray[indexPath.row]
        
        return cell!
    }
    
    // どのセルが選択されたのか保存しておくための変数
    var selectedPosition = -1
    
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPosition = indexPath.row
        performSegue(withIdentifier: "ToPreview", sender: nil)
    }
    
    //画面遷移時にデータを送る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPreview" {
            let nextVC = segue.destination as! PreviewViewController
            nextVC.titleText = nameArray[selectedPosition]
            nextVC.outlineText = outlineArray[selectedPosition]
            nextVC.MemoText = memoArray[selectedPosition]
            nextVC.fromSelectView = true
            
        }
        
        
    }
}
