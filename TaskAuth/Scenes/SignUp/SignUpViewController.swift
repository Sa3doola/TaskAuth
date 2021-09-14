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
    
    var lat: Double = 0
    var lng: Double = 0
    var cityId: Int? = 0
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    private func signUp() {
        let name = userNameTxtField.text!
        let phone = phoneNumberTxtField.text!
        let cityID = cityId!
        let address = adressLabel.text!
        let lat = self.lat
        let lng = self.lng
        let password = passwordTxtField.text!
        let confirmPass = confirmPasswordTxtField.text!
        presenter?.validate(name: name, phone: phone, cityId: cityID, address: address,
                            lat: lat, lng: lng, password: password, confPassword: confirmPass)
    }
    
    // MARK: - IBActions
    
    @IBAction func cityPickerWasTapped(_ sender: UIButton) {
        presenter?.setCities()
    }
    
    @IBAction func locationWasTapped(_ sender: UIButton) {
        presenter?.goToMap()
    }
    
    @IBAction func signUpWasTapped(_ sender: UIButton) {
        signUp()
    }
    
    @IBAction func loginWasTapped(_ sender: UIButton) {
        presenter?.backToLogin()
    }
}

// MARK: - LocationDataDelegete

extension SignUpViewController: LocationDataDelegate {
    func sendLocationBack(lat: Double, lng: Double, address: String) {
        self.lat = lat
        self.lng = lng
        adressLabel.text = address
        adressLabel.isHidden = false
    }
}

// MARK: - UITextFieldDelegate

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTxtField {
            phoneNumberTxtField.becomeFirstResponder()
        }
        if textField == phoneNumberTxtField {
            passwordTxtField.becomeFirstResponder()
        }
        if textField == passwordTxtField {
            confirmPasswordTxtField.becomeFirstResponder()
        }
        return true
    }
}

// MARK: - SignUPView, UIPickerViewDelegate and DataSource

extension SignUpViewController: SignUpView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - SignUPView
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Please Try Again",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showPickerView() {
        let vc = SignUpViewController()
        vc.preferredContentSize = CGSize(width: 250, height: 250)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0,
                                                    width: 250,
                                                    height: 250))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        let alert = UIAlertController(title: "Please Select City", message: "", preferredStyle: .alert)
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UIPickerViewDelegate and DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter?.numberOfCities() ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let name = presenter?.citiesForPicker(row: row)
        return name?.0 ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityNameLabel.isHidden = false
        let name = presenter?.citiesForPicker(row: row)
        cityNameLabel.text = name?.0
        cityId = name?.1 ?? 0
    }
}
