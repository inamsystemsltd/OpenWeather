//
//  CitySearchPresenter.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

class CitySearchPresenter {

    // MARK: Properties

    weak var view: CitySearchView?
    var router: CitySearchWireframe?
    var interactor: CitySearchUseCase?
}

extension CitySearchPresenter: CitySearchPresentation {
    func fetchWeatherDetails(citiesString: String) {
        let cities = breakCityNames(citiesString: citiesString)
        if cities.count > 2 && cities.count < 8{
            interactor?.fetchCitiesWeatherDetails(cities: cities)
        }else{
            view?.showError(errorString: "Please choose minimum of 3 and maximum of 7 comma separated cities.")
        }
    }
    
    func  breakCityNames(citiesString:String) -> [String] {
        var cities = [String]()
        let strings = citiesString.split(separator: ",")
        for str in strings{
            cities.append(str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        }
        return cities
    }
}

extension CitySearchPresenter: CitySearchUseCaseOutput {
    func citiesReceived(citiesResult: [CityWeatherResultModel], unavailableCities:[String]) {
        var rowModels = [BaseRowModel]()
        for cityDetail in citiesResult{
            let rowModel = BaseRowModel()
            rowModel.rowCellIdentifier = "WeatherDetailForCityCell"
            rowModel.rowValue = cityDetail
            rowModels.append(rowModel)
        }
        view?.citiesWeatherDetailsRowModelsReceived(rowModels: rowModels)
        
        if rowModels.count == 0 && unavailableCities.count > 0{
            view?.showError(errorString: "No weather details found for the requested cities")
        }else if unavailableCities.count > 0{
            var unavailable = ""
            for city in unavailableCities {
                unavailable += "\(city), "
            }
            unavailable = unavailable.trimmingCharacters(in: CharacterSet(charactersIn: " ,"))
            view?.showError(errorString: "Weather details against [\(unavailable)] not found")
        }
    }
}
