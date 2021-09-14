//
//  LoginModel.swift
//  SecoundTaskMVP
//
//  Created by Saad Sherif on 9/5/21.
//

import Foundation

struct LoginModel: Codable {
    let key: String?
    let data: DataLogin?
    let msg: String?
    let code: Int?
}

struct DataLogin: Codable {
    let userBaseInfo: UserBaseInfo?
    let providerInfo: String?

    enum CodingKeys: String, CodingKey {
        case userBaseInfo = "user_base_info"
        case providerInfo = "provider_info"
    }
}

struct AddressClient: Codable {
    let id: Int?
    let address: String?
    let addressType: AddressType?
    let lat, lng, isFav: String?

    enum CodingKeys: String, CodingKey {
        case id, address
        case addressType = "address_type"
        case lat, lng
        case isFav = "is_fav"
    }
}


