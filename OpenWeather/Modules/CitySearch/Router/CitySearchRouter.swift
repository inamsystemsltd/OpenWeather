//
//  CitySearchRouter.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import UIKit

class CitySearchRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> CitySearchViewController {
        let viewController = CitySearchViewController.instantiate(fromAppStoryboard: .CitySearch)
        let presenter = CitySearchPresenter()
        let router = CitySearchRouter()
        let interactor = CitySearchInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension CitySearchRouter: CitySearchWireframe {
    // TODO: Implement wireframe methods
}
