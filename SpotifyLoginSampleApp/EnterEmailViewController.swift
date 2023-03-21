//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 신희권 on 2023/03/21.
//

import UIKit

class EnterEmailViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var passwodTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 30
        nextButton.isEnabled = false
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
        
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    
        
    }
    
    
}
