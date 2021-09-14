//
//  LoginViewController.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = LoginConfiguratorImplementation()
    
    var presenter: LoginPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(LoginViewController: self)
        phoneNumberTxtField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    func logIn() {
        let phone = phoneNumberTxtField.text!
        let password = passwordTxtField.text!
        presenter?.validate(phone: phone, password: password)
    }
    
    // MARK: - IBActions
    
    @IBAction func forgetPasswordWasTapped(_ sender: UIButton) {
        print("Forget Passowrd")
    }
    
    @IBAction func loginWasTapped(_ sender: UIButton) {
        logIn()
    }
    
    @IBAction func signupWasTapped(_ sender: UIButton) {
        presenter?.goToSignUp()
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == phoneNumberTxtField {
            passwordTxtField.becomeFirstResponder()
        }
        return true
    }
}

// MARK: - LoginView

extension LoginViewController: LoginView {
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Please Try Again",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
