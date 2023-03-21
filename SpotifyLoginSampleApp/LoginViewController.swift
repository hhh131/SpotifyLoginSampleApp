//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 신희권 on 2023/03/20.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet var appleLoginButton: UIButton!
    @IBOutlet var googleLoginButton: UIButton!
    @IBOutlet var emailLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [appleLoginButton,googleLoginButton,emailLoginButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navigationbar 숨기기
        navigationController?.navigationBar.isHidden = true
        
        
    }
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
    }
}
