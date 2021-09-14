//
//  ActivationViewController.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit

final class ActivationViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator: ActivationConfiguratorImplementation!
    
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
        OTPTxtField1.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    func activate() {
        let txt1 = OTPTxtField1.text!
        let txt2 = OTPTxtField2.text!
        let txt3 = OTPTxtField3.text!
        let txt4 = OTPTxtField4.text!
        let code = txt1 + txt2 + txt3 + txt4
        presenter?.activate(code: code)
    }
    
    // MARK: - IBActions
    
    @IBAction func resendCodeWasTapped(_ sender: UIButton) {
        print("Resend Code!")
    }
    
    @IBAction func submitWasTapped(_ sender: UIButton) {
        activate()
    }
}

// MARK: - UITextFieldDelegate

extension ActivationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1)  && (string.count > 0){
            if textField == OTPTxtField1 {
                OTPTxtField2.becomeFirstResponder()
            }
            if textField == OTPTxtField2 {
                OTPTxtField3.becomeFirstResponder()
            }

            if textField == OTPTxtField3 {
                OTPTxtField4.becomeFirstResponder()
            }

            if textField == OTPTxtField4 {
                OTPTxtField4.resignFirstResponder()
            }

            textField.text = string

            return false

        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == OTPTxtField2 {
                OTPTxtField1.becomeFirstResponder()
            }
            if textField == OTPTxtField3 {
                OTPTxtField2.becomeFirstResponder()
            }

            if textField == OTPTxtField4 {
                OTPTxtField3.becomeFirstResponder()
            }

            if textField == OTPTxtField1 {
                OTPTxtField1.resignFirstResponder()
            }
            textField.text = ""

            return false

        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        return true
    }
}

extension ActivationViewController: ActivationView {}
