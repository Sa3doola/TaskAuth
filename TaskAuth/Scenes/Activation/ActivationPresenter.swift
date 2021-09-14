//
//  ActivationPresenter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import Foundation

protocol ActivationView: AnyObject {
    
}

protocol ActivationPresenter {
    func activate(code: String)
}

class ActivationPresenterImplementation: ActivationPresenter {
    
    fileprivate weak var view: ActivationView?
    internal let router: ActivationRouter
    internal let interactor : ActivationInteractor
    fileprivate let phone: String
    
    init(view: ActivationView,router: ActivationRouter,interactor:ActivationInteractor, phone: String) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.phone = phone
    }
    
    func activate(code: String) {
        interactor.activation(phone: phone, code: code, deviceId: "123654123654", deviceType: "ios", uuid: NSUUID().uuidString) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print("Activation Model: \(model)")
                self.router.goToLogin()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
