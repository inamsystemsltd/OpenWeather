//
//  DashboardViewController.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: BaseViewController {

    // MARK: Properties

    var presenter: DashboardPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func searchByCitiesTapped(_ sender: Any) {
        presenter?.navigateToCitySearch()
    }
    
    @IBAction func searchByGPSTapped(_ sender: Any) {
        presenter?.navigateToGPSSearch()
    }
    
}

extension DashboardViewController: DashboardView {
    // TODO: implement view output methods
}
