//
//  GPSSearchServices.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Alamofire
import Foundation

class GPSSearchServices {

    func executeGPSLocationDetail(lat: String, lon:String, completionHandler: @escaping (DataResponse<GPSSearchResultModel>) -> ()) {
        let route = APIRouter.forecast(latitudes: lat, longitude: lon)
        APIClient.perform(route: route) { (handler: DataResponse<GPSSearchResultModel>) in
            completionHandler(handler)
        }
    }

}
