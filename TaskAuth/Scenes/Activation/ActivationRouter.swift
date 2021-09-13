//
//  ActivationRouter.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit


protocol ActivationRouter {
  
}

class ActivationRouterImplementation: ActivationRouter {
    fileprivate weak var ActivationViewController: ActivationViewController?
    
    init(ActivationViewController: ActivationViewController) {
        self.ActivationViewController = ActivationViewController
    }
    
    
}
