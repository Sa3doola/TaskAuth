//
//  UserActivationModel.swift
//  SecoundTaskMVP
//
//  Created by Saad Sherif on 9/5/21.
//

import Foundation

struct UserActivationModel: Codable {
    let key: String?
    let data: DataActivation?
    let msg: String?
    let code: Int?
}

// MARK: - DataClass

struct DataActivation: Codable {
    let userBaseInfo: UserBaseInfo?

    enum CodingKeys: String, CodingKey {
        case userBaseInfo = "user_base_info"
    }
}

// MARK: - UserBaseInfo

struct UserBaseInfo: Codable {
    let id: Int?
    let uuid: String?
    let cityID: Int?
    let cityName: String?
    let name, phone: String?
    let email: String?
    let lang: String?
    let image: String?
    let userType, status: String?
    let address: [AddressClient]?
    let token: String?

    enum CodingKeys: String, CodingKey {
        case id, uuid
        case cityID = "city_id"
        case cityName = "city_name"
        case name, phone, email, lang, image
        case userType = "user_type"
        case status, address, token
    }
}

// MARK: - AddressType

struct AddressType: Codable {
    let id: Int?
    let name, status: String?
    let icon: String?
}
