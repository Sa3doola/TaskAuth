//
//  ActivationRouter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit

protocol ActivationRouter {
    func goToLogin()
}

class ActivationRouterImplementation: ActivationRouter {
    fileprivate weak var ActivationViewController: ActivationViewController?
    
    init(ActivationViewController: ActivationViewController) {
        self.ActivationViewController = ActivationViewController
    }
    
    let storyboard = Storyboard.authStoryboard
    
    func goToLogin() {
        let vc: LoginViewController = storyboard.instantiateViewController()
        self.ActivationViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
