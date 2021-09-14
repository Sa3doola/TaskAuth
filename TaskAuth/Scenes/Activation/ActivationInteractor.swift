//
//  ActivationInteractor.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import Alamofire

class ActivationInteractor {
    
    func activation(phone: String, code: String, deviceId: String, deviceType: String, uuid: String, completion: @escaping completion<UserActivationModel>) {
        AF.request(APIRouter.activation(phone: phone, code: code, deviceID: deviceId, deviceType: deviceType, uuid: uuid)).responseDecodable { (response) in
            completion(response.result)
        }
    }
}
