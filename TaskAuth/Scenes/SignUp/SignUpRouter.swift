//
//  SignUpRouter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit


protocol SignUpRouter {
  
}

class SignUpRouterImplementation: SignUpRouter {
    fileprivate weak var SignUpViewController: SignUpViewController?
    
    init(SignUpViewController: SignUpViewController) {
        self.SignUpViewController = SignUpViewController
    }
    
    
}
