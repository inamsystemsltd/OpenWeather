//
//  Enviornment.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

enum Environment {
    case staging

    var baseURL: String {
        switch self {
        case .staging:
            return "https://api.openweathermap.org/data/2.5/"
        }
    }

    var headers: [String: String] {
        switch self {
        case .staging:
            return ["Content-Type": "application/json"]
        }
    }

    var secretKey: String {
        switch self {
        case .staging:
            return "fb5c7b073c76e73b4505f3fffc24f18a"
        }
    }
}

struct Endpoints {
    static let citySearch = "weather"
    static let forecast = "forecast"
}
