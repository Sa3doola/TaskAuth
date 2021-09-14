//
//  LoginRouter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit

protocol LoginRouter {
    func goToSignUp()
}

class LoginRouterImplementation: LoginRouter {
    fileprivate weak var LoginViewController: LoginViewController?
    
    init(LoginViewController: LoginViewController) {
        self.LoginViewController = LoginViewController
    }
    
    let authStoryboard = Storyboard.authStoryboard
    
    func goToSignUp() {
        let vc: SignUpViewController = authStoryboard.instantiateViewController()
        self.LoginViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
