//
//  RootRouter.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import UIKit


protocol RootWireframe: class {
    func presentRootScreen(in window: UIWindow)
}

class RootRouter: RootWireframe {
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = BaseNavigationController(rootViewController: DashboardRouter.setupModule())
    }

    func setupAppRoot() {
        UIApplication.shared.keyWindow?.rootViewController = BaseNavigationController(rootViewController: DashboardRouter.setupModule())
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
