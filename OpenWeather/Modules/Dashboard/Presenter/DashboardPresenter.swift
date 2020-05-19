//
//  DashboardPresenter.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

class DashboardPresenter {

    // MARK: Properties

    weak var view: DashboardView?
    var router: DashboardWireframe?
    var interactor: DashboardUseCase?
}

extension DashboardPresenter: DashboardPresentation {
    func navigateToCitySearch() {
        router?.navigateToCitySearch()
    }
    
    func navigateToGPSSearch() {
        router?.navigateToGPSSearch()
    }
}

extension DashboardPresenter: DashboardUseCaseOutput {
    // TODO: implement interactor output methods
}
