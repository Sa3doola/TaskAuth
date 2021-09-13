//
//  ActivationPresenter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import Foundation

protocol ActivationView: AnyObject {

}


protocol ActivationCellView {
    
}

protocol ActivationPresenter {
    func viewDidLoad()
    func configure(cell: ActivationCellView, forRow row: Int)
}

class ActivationPresenterImplementation: ActivationPresenter {
    fileprivate weak var view: ActivationView?
    internal let router: ActivationRouter
    internal let interactor : ActivationInteractor

    
    init(view: ActivationView,router: ActivationRouter,interactor:ActivationInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: ActivationCellView, forRow row: Int) {
       
    }

}
