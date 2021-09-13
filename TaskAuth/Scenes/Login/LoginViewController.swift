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
        presenter?.viewDidLoad()
    }
    
    // MARK: - Helper Functions
    
    // MARK: - IBActions
    
    @IBAction func forgetPasswordWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func loginWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func signupWasTapped(_ sender: UIButton) {
        
    }
}

extension LoginViewController: LoginView {}
