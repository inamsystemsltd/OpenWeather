//
//  DashboardRouter.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import UIKit

class DashboardRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> DashboardViewController {
        let viewController = DashboardViewController.instantiate(fromAppStoryboard: .Dashboard)
        let presenter = DashboardPresenter()
        let router = DashboardRouter()
        let interactor = DashboardInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension DashboardRouter: DashboardWireframe {
    func navigateToCitySearch() {
        let citySearchVC = CitySearchRouter.setupModule()
        view?.navigationController?.pushViewController(citySearchVC, animated: true)
    }
    
    func navigateToGPSSearch() {
        let gpsSearchVC = GPSSearchRouter.setupModule()
        view?.navigationController?.pushViewController(gpsSearchVC, animated: true)
    }
}
