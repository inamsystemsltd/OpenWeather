//
//  GPSSearchContract.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

protocol GPSSearchView: class {
    // TODO: Declare view methods
    func showLoading()
    func hideLoading()
    func showError(error:String)
    func weatherDetailRowModelsReceived(rowModels:[SectionRowModel])
}

protocol GPSSearchPresentation: class {
    // TODO: Declare presentation methods
    func requestLocationPermission()
}

protocol GPSSearchUseCase: class {
    // TODO: Declare use case methods
    func getWeatherDetailsViaGPS(lat:String,lon:String)
}

protocol GPSSearchUseCaseOutput: class {
    // TODO: Declare interactor output methods
    func weatherDetailsViaGPSFetched(response:GPSSearchResultModel)
    func failedToFetchWeatherDetails(errorString:String)
}

protocol GPSSearchWireframe: class {
    // TODO: Declare wireframe methods
}
