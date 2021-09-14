//
//  URLRequestBulider.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import Alamofire

typealias completion<T: Codable> = (Result<T, AFError>) -> Void

protocol URLRequestBuilder: URLRequestConvertible {
    
    var mainURL: URL { get }
    
    var requestURL: URL { get }
    
    var path: String { get }
    
    var parameters: Parameters? { get }
    
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
}

extension URLRequestBuilder {
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var mainURL: URL {
        return URL(string: "https://aldakhil.4hoste.com/api/")!
    }
    
    
    var requestURL: URL {
        return mainURL.appendingPathComponent(path)
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
