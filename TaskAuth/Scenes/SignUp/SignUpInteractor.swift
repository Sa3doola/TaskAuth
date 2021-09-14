//
//  SignUpInteractor.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import Alamofire

class SignUpInteractor {
    
    func SignUp(userName: String, phone: String, cityId: Int, lat: Double, lon: Double,
                adress: String, password: String, confirmPassword: String, adressTypeId: String,
                completion: @escaping completion<RegisterModel>) {
        AF.request(APIRouter.register(name: userName, phoneNumber: phone, city_Id: cityId, lat: lat, lon: lon, address: adress, password: password, password_confirmation: confirmPassword, address_type_id: adressTypeId)).responseDecodable { (response) in
            completion(response.result)
        }
    }
    
    func getCities(completion: @escaping completion<ProviderDataModel>) {
        AF.request(APIRouter.getCities).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
