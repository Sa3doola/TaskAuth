//
//  SignUpViewController.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = SignUpConfiguratorImplementation()
    
    var presenter: SignUpPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(SignUpViewController: self)
        presenter?.viewDidLoad()
    }
    
    // MARK: - Helper Functions
    
    // MARK: - IBActions
    
    @IBAction func cityPickerWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func locationWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func loginWasTapped(_ sender: UIButton) {
        
    }
}

extension SignUpViewController: SignUpView {}
