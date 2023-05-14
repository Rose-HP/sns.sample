//
//  HomeController.swift
//  sns.sample
//
//  Created by Rifah Tabassum Ako Tanida on 2023/05/14.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    @IBAction func studyButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "StudyController") as! StudyController
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}

