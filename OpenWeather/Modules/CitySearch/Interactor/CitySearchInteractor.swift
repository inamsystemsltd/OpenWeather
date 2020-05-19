//
//  CitySearchInteractor.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

class CitySearchInteractor {
    // MARK: Properties

    weak var output: CitySearchUseCaseOutput?
    let services = CitySearchServices()
    let dispatchGroup = DispatchGroup()
}

extension CitySearchInteractor: CitySearchUseCase {
    func fetchCitiesWeatherDetails(cities: [String]) {
        var citiesResultList = [CityWeatherResultModel]()
        var unavailableCities = [String]()
        for city in cities{
            dispatchGroup.enter()
            services.executeCityWeatherDetail(city: city) { (response) in
                self.dispatchGroup.leave()
                if let cityDetailResponseModel = response.result.value{
                    print(cityDetailResponseModel.name ?? "--")
                    if let name = cityDetailResponseModel.name, !name.isEmpty, city.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased() == name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased(){
                        citiesResultList.append(cityDetailResponseModel)
                    }else{
                        unavailableCities.append(city)
                    }
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.output?.citiesReceived(citiesResult: citiesResultList, unavailableCities: unavailableCities)
        }
    }
}
