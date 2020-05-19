//
//  GPSSearchRouter.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import UIKit

class GPSSearchRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> GPSSearchViewController {
        let viewController = GPSSearchViewController.instantiate(fromAppStoryboard: .GPSSearch)
        let presenter = GPSSearchPresenter()
        let router = GPSSearchRouter()
        let interactor = GPSSearchInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension GPSSearchRouter: GPSSearchWireframe {
    // TODO: Implement wireframe methods
}
