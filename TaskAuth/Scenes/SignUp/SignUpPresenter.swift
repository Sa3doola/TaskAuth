//
//  SignUpPresenter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import Foundation

protocol SignUpView: AnyObject {

}


protocol SignUpCellView {
    
}

protocol SignUpPresenter {
    func viewDidLoad()
    func configure(cell: SignUpCellView, forRow row: Int)
}

class SignUpPresenterImplementation: SignUpPresenter {
    fileprivate weak var view: SignUpView?
    internal let router: SignUpRouter
    internal let interactor : SignUpInteractor

    
    init(view: SignUpView,router: SignUpRouter,interactor:SignUpInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: SignUpCellView, forRow row: Int) {
       
    }

}
