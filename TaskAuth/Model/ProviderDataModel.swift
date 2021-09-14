//
//  ProviderDataModel.swift
//  SecondTask
//
//  Created by Saad Sherif on 9/7/21.
//

import Foundation

struct ProviderDataModel: Codable {
    let key: String?
    let data: DataProvider?
    let msg: String?
    let code: Int?
}

// MARK: - DataClass
struct DataProvider: Codable {
    let cities: [City]?
    let categories: [Category]?
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name, categoryDescription: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case categoryDescription = "description"
        case image
    }
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
}
