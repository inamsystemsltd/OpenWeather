//
//  CitySearchContract.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

protocol CitySearchView: class {
    // TODO: Declare view methods
    func citiesWeatherDetailsRowModelsReceived(rowModels:[BaseRowModel])
    func showError(errorString:String)
    func showLoading()
    func hideLoading()
}

protocol CitySearchPresentation: class {
    // TODO: Declare presentation methods
    func fetchWeatherDetails(citiesString:String)
}

protocol CitySearchUseCase: class {
    // TODO: Declare use case methods
    func fetchCitiesWeatherDetails(cities:[String])
}

protocol CitySearchUseCaseOutput: class {
    // TODO: Declare interactor output methods
    func citiesReceived(citiesResult:[CityWeatherResultModel], unavailableCities:[String])
}

protocol CitySearchWireframe: class {
    // TODO: Declare wireframe methods
}
