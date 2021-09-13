//
//  ActivationViewController.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit

final class ActivationViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = ActivationConfiguratorImplementation()
    
    var presenter: ActivationPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var OTPTxtField1: UITextField!
    @IBOutlet weak var OTPTxtField2: UITextField!
    @IBOutlet weak var OTPTxtField3: UITextField!
    @IBOutlet weak var OTPTxtField4: UITextField!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(ActivationViewController: self)
        presenter?.viewDidLoad()
    }
    
    // MARK: - Helper Functions
    
    // MARK: - IBActions
    
    @IBAction func resendCodeWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func submitWasTapped(_ sender: UIButton) {
        
    }
}



extension ActivationViewController: ActivationView {}
