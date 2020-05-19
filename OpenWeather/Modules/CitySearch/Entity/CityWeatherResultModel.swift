//
//  CityWeatherResultModel.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation


struct CityWeatherResultModel: Codable {
    
    let name: String?
    let weather:[WeatherModel]?
    let wind:WindModel?
    let main:MainDataModel?
    let dt_txt:String?

    enum CodingKeys: String, CodingKey {
        case name
        case weather
        case wind
        case main
        case dt_txt
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        weather = try values.decodeIfPresent([WeatherModel].self, forKey: .weather)
        wind = try values.decodeIfPresent(WindModel.self, forKey: .wind)
        main = try values.decodeIfPresent(MainDataModel.self, forKey: .main)
        dt_txt = try values.decodeIfPresent(String.self, forKey: .dt_txt)
    }
}
