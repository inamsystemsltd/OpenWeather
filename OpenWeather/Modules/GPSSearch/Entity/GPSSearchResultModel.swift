//
//  GPSSearchResultModel.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

struct GPSSearchResultModel: Codable {
    
    let list: [CityWeatherResultModel]?

    enum CodingKeys: String, CodingKey {
        case list
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        list = try values.decodeIfPresent([CityWeatherResultModel].self, forKey: .list)
    }
}
