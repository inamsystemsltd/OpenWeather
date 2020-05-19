//
//  GPSSearchInteractor.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

class GPSSearchInteractor {
    // MARK: Properties

    weak var output: GPSSearchUseCaseOutput?
    let services = GPSSearchServices()
}

extension GPSSearchInteractor: GPSSearchUseCase {
    func getWeatherDetailsViaGPS(lat: String, lon: String) {
        services.executeGPSLocationDetail(lat: lat, lon: lon) { (response) in
            if let responseValue = response.result.value {
                self.output?.weatherDetailsViaGPSFetched(response: responseValue)
            }else{
                self.output?.failedToFetchWeatherDetails(errorString: "Unable to fetch details at this location.")
            }
        }
    }
    
    // TODO: Implement use case methods
}
