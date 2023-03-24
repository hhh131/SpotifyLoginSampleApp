//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 신희권 on 2023/03/21.
//

import UIKit
import FirebaseAuth

class EnterEmailViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var passwodTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 30
     //   nextButton.isEnabled = false
        emailTextField.delegate = self
        passwodTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = UIColor.gray
        
        
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        //Firebase 이메일/ 비밀번호 인증
        let email = emailTextField.text ?? ""
        let password = passwodTextField.text ?? ""
        
        //신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] _, error in
            guard let self  = self else { return }
            if let error = error {
                let code = (error as NSError).code
                switch code{
                    case 17007:
                    self.loginUser(withEmail: email, password: password)
                    default:
                    self.errorLabel.text = error.localizedDescription
                }
            }else {
                self.showMainViewController()
            }
        }
    }
    
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
    
    private func loginUser(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] _, error in
            guard let self = self else { return }
            
            if let error = error {
                self.errorLabel.text = error.localizedDescription
            } else {
                self.showMainViewController()
            }
        }
        
    }
}

extension EnterEmailViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwodTextField.text == ""
        
       // nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    
        
    }
    
    
}
