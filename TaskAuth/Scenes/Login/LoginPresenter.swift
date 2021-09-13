//
//  LoginPresenter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import Foundation

protocol LoginView: AnyObject {

}


protocol LoginCellView {
    
}

protocol LoginPresenter {
    func viewDidLoad()
    func configure(cell: LoginCellView, forRow row: Int)
}

class LoginPresenterImplementation: LoginPresenter {
    fileprivate weak var view: LoginView?
    internal let router: LoginRouter
    internal let interactor : LoginInteractor

    
    init(view: LoginView,router: LoginRouter,interactor:LoginInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: LoginCellView, forRow row: Int) {
       
    }

}
