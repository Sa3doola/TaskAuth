//
//  Validation.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import Foundation

struct ValidateService {
    
    static func validate(name: String?) throws -> String {
        guard let name = name, !name.isEmpty else {
            throw ValidationErrors.emptyName
        }
        guard name.count >= 3 else {
            throw ValidationErrors.shortName
        }
        guard name.count <= 60 else {
            throw ValidationErrors.longName
        }
        return name
    }
    
    static func validate(phone: String?) throws -> String {
        guard let phone = phone, !phone.isEmpty else {
            throw ValidationErrors.emptyNumber
        }
        guard phone.count >= 10 else {
            throw ValidationErrors.shortNumber
        }
        return phone
    }
    
    static func validate(cityId: Int?) throws -> Int {
        guard let id = cityId, cityId != 0 else {
            throw ValidationErrors.emptyCityID
        }
        return id
    }
    
    static func validate(adress: String?) throws -> String {
        guard let address = adress, !address.isEmpty else {
            throw ValidationErrors.emptyAdress
        }
        return address
    }
    
    static func validate(password: String?) throws -> String {
        guard let password = password, !password.isEmpty else {
            throw ValidationErrors.emptyPassword
        }
        guard password.count >= 6 else {
            throw ValidationErrors.shortPassword
        }
        return password
    }
    
    static func validate(confirmPassword: String?) throws -> String {
        guard let password = confirmPassword, !password.isEmpty else {
            throw ValidationErrors.emptyConfrimPassword
        }
        guard password.count >= 6 else {
            throw ValidationErrors.shortPassword
        }
        return password
    }
    
    static func validate(password: String?, confirmPassword: String?) throws -> Bool {
        guard password == confirmPassword else {
            throw ValidationErrors.confrimPassword
        }
        return true
    }
}

enum ValidationErrors: Error {
    case emptyName
    case shortName
    case longName
    case emptyNumber
    case shortNumber
    case emptyCityID
    case emptyAdress
    case emptyPassword
    case shortPassword
    case emptyConfrimPassword
    case confrimPassword
}

extension ValidationErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyName:
            return "Please enter your name".localizedCapitalized
        case .shortName:
            return "Name should be 3 lettres at least".localizedCapitalized
        case .longName:
            return "Name should be 60 letters maxmum".localizedCapitalized
        case .emptyNumber:
            return "Please enter your Number".localizedCapitalized
        case .shortNumber:
            return "Number should be 10 Number at least".localizedCapitalized
        case .emptyCityID:
            return "Please you must choose your city".localizedCapitalized
        case .emptyAdress:
            return "You must choose your Adress".localizedCapitalized
        case .emptyPassword:
            return "Please enter your password".localizedCapitalized
        case .shortPassword:
            return "Password should be 6 letters at least".localizedCapitalized
        case .emptyConfrimPassword:
            return "Please enter your confrim Password".localizedCapitalized
        case .confrimPassword:
            return "Password Not match Confrim Password".localizedCapitalized
        }
    }
}
