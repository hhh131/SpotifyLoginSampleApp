//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 신희권 on 2023/03/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var welcomLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
