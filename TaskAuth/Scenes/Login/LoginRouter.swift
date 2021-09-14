//
//  LoginRouter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit

protocol LoginRouter {
    func goToSignUp()
    func goToActivation(phone: String)
}

class LoginRouterImplementation: LoginRouter {
    
    fileprivate weak var LoginViewController: LoginViewController?
    var phone: String!
    init(LoginViewController: LoginViewController) {
        self.LoginViewController = LoginViewController
    }
    
    let storyboard = Storyboard.authStoryboard
    
    func goToSignUp() {
        let vc: SignUpViewController = storyboard.instantiateViewController()
        self.LoginViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToActivation(phone: String) {
        self.phone = phone
        let vc: ActivationViewController = storyboard.instantiateViewController()
        vc.configurator = ActivationConfiguratorImplementation(phone: phone)
        self.LoginViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
