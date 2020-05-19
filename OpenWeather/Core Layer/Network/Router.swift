//
//  Router.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case forecast(latitudes: String, longitude: String)
    case citySearch(cityName: String)
    
    // MARK: - HTTPMethod
    
    private var method: HTTPMethod {
        switch self {
        case .forecast:
            return .get
        case .citySearch:
            return.get
        }
    }
    
    // MARK: - Path
    
    private var path: String {
        switch self {
        case .forecast(let latitude, let longitude):
//            api.openweathermap.org/data/2.5/forecast?lat=35&lon=139
            return Endpoints.forecast + "?lat=\(latitude)&lon=\(longitude)&APPID=\(Environment.staging.secretKey)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
        case .citySearch(let cityName):
//            api.openweathermap.org/data/2.5/weather?q={city name}&appid={your api key}
            return Endpoints.citySearch + "?q=\(cityName)&APPID=\(Environment.staging.secretKey)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
    }
    
    // MARK: - Parameters
    
    private var parameters: Parameters? {
        switch self {
        case .forecast:
            return nil
        case .citySearch:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
//        let url = try Environment.staging.baseURL.asURL()
        let url = URL(string: Environment.staging.baseURL + path)
        var urlRequest = URLRequest(url: url!)
        
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.allHTTPHeaderFields = Environment.staging.headers
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
