//
//  DashboardContract.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation

protocol DashboardView: class {
    // TODO: Declare view methods
}

protocol DashboardPresentation: class {
    // TODO: Declare presentation methods
    func navigateToCitySearch()
    func navigateToGPSSearch()
}

protocol DashboardUseCase: class {
    // TODO: Declare use case methods
}

protocol DashboardUseCaseOutput: class {
    // TODO: Declare interactor output methods
}

protocol DashboardWireframe: class {
    // TODO: Declare wireframe methods
    func navigateToCitySearch()
    func navigateToGPSSearch()
}
