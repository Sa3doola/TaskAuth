//
//  LoginConfigurator.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import Foundation


protocol LoginConfigurator {
    func configure(LoginViewController:LoginViewController)
}


class LoginConfiguratorImplementation {

    func configure(LoginViewController:LoginViewController) {
        let view = LoginViewController
        let router = LoginRouterImplementation(LoginViewController: view)
        
        let interactor = LoginInteractor()
        let presenter = LoginPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        LoginViewController.presenter = presenter
    }
    
}
