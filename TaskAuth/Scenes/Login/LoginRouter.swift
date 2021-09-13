//
//  LoginRouter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit


protocol LoginRouter {
  
}

class LoginRouterImplementation: LoginRouter {
    fileprivate weak var LoginViewController: LoginViewController?
    
    init(LoginViewController: LoginViewController) {
        self.LoginViewController = LoginViewController
    }
    
    
}
