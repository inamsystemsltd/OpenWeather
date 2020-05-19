//
//  GPSSearchPresenter.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import CoreLocation

class GPSSearchPresenter:NSObject {
    
    // MARK: Properties
    
    weak var view: GPSSearchView?
    var router: GPSSearchWireframe?
    var interactor: GPSSearchUseCase?
    let locationManager = CLLocationManager()
    
}

extension GPSSearchPresenter: GPSSearchPresentation {
    func requestLocationPermission() {
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
    }
    
    func setupLocationManager(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    // TODO: implement presentation methods
}

extension GPSSearchPresenter: GPSSearchUseCaseOutput {
    func weatherDetailsViaGPSFetched(response: GPSSearchResultModel) {
        print(response)
        var detailsHashMap = [String:[Any]]()

        for item in response.list ?? []{
            if let itemDate = item.dt_txt, !itemDate.isEmpty{
                let rowModel = BaseRowModel()
                rowModel.rowCellIdentifier = "WeatherDetailForGPSCell"
                rowModel.rowValue = item
                if let _ = detailsHashMap[itemDate.getDateFromDateString()]{
                    detailsHashMap[itemDate.getDateFromDateString()]?.append(rowModel)
                }else{
                    detailsHashMap[itemDate.getDateFromDateString()] = [Any]()
                    detailsHashMap[itemDate.getDateFromDateString()]?.append(rowModel)
                }
            }
        }
        
        var sectionsRowModels = [SectionRowModel]()
        
        let sortedHashmap = detailsHashMap.sorted { (val1, val2) -> Bool in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date1String = val1.key
            let date2String = val2.key
            let date1 = dateFormatter.date(from: String(date1String))!
            let date2 = dateFormatter.date(from: String(date2String))!
            return date1 < date2
        }
        
        for detail in sortedHashmap{
            let sectionModel = SectionRowModel()
            sectionModel.title = detail.key
            sectionModel.rowValues = detail.value
            sectionsRowModels.append(sectionModel)
        }
        
        if sectionsRowModels.count == 0 {
            view?.showError(error: "No weather details found for this area.")
        }
        view?.weatherDetailRowModelsReceived(rowModels: sectionsRowModels)
    }
    
    func failedToFetchWeatherDetails(errorString: String) {
        view?.showError(error: errorString)
    }
}

extension GPSSearchPresenter:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
    
        interactor?.getWeatherDetailsViaGPS(lat: String(format: "%f", locValue.latitude), lon: String(format: "%f", locValue.longitude))
        manager.stopUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied) {
            view?.showError(error: "You need to allow location access to use this feature, please go to settings and enable location services access for this application.")
        }else{
            setupLocationManager()
        }
    }
}
