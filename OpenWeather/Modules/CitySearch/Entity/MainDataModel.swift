//
//  MainDataModel.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

struct MainDataModel: Codable {
    
    let temp_min: Double?
    let temp_max: Double?

    enum CodingKeys: String, CodingKey {
        case temp_min
        case temp_max
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temp_min = try values.decodeIfPresent(Double.self, forKey: .temp_min)
        temp_max = try values.decodeIfPresent(Double.self, forKey: .temp_max)
    }
}
