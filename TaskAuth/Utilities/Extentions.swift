//
//  Extentions.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
    
    static var authStoryboard: UIStoryboard {
        return UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
    }
}

extension UIStoryboard {
    func instantiateViewController<T>(withIdentifier identifier: String = String(describing: T.self)) -> T {
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}
