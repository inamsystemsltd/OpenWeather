//
//  Client.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    // MARK: - GET MEHTOD

    /// This is the generic webservice method of type 'GET' for web service calling
    ///
    /// - Parameters:
    ///   - action: service end point
    ///   - completionHandler: generic call back completion handler
    class func perform<T: Decodable>(route: APIRouter, completionHandler: @escaping (DataResponse<T>) -> ()) {
        Alamofire.request(route).responseObject { response in
            completionHandler(response)
        }
    }
}
