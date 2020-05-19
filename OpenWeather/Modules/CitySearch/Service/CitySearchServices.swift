//
//  CitySearchServices.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Alamofire
import Foundation

class CitySearchServices {

    func executeCityWeatherDetail(city: String, completionHandler: @escaping (DataResponse<CityWeatherResultModel>) -> ()) {
        let route = APIRouter.citySearch(cityName: city)
        APIClient.perform(route: route) { (handler: DataResponse<CityWeatherResultModel>) in
            completionHandler(handler)
        }
    }
}
