//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 신희권 on 2023/03/21.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    @IBOutlet var welcomLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
        let email = Auth.auth().currentUser?.email ?? "고객"
        
        welcomLabel.text = """
        환영합니다. \(email)님
        """
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
