//
//  SignUpRouter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit


protocol SignUpRouter {
    func goToMap()
    func goToActivation(phone: String)
    func backToLogin()
}

class SignUpRouterImplementation: SignUpRouter {
    
    fileprivate weak var SignUpViewController: SignUpViewController?
    var phone: String!
    
    init(SignUpViewController: SignUpViewController) {
        self.SignUpViewController = SignUpViewController
    }
    
    let storyboard = Storyboard.authStoryboard
    
    func goToMap() {
        let vc: MapViewController = storyboard.instantiateViewController()
        vc.delegate = self.SignUpViewController
        self.SignUpViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToActivation(phone: String) {
        self.phone = phone
        let vc: ActivationViewController = storyboard.instantiateViewController()
        vc.configurator = ActivationConfiguratorImplementation(phone: phone)
        self.SignUpViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func backToLogin() {
        self.SignUpViewController?.navigationController?.popViewController(animated: true)
    }
}
