//
//  AppDelegate.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

extension AppDelegate {
    // Here you can SetupApp basic enviroment
    internal func setupApp(window: UIWindow) {
        _boot()
        _setupKeyboard()
    }

    internal func _boot() {
        if let window = self.window {
            window.backgroundColor = .white
            window.tintColor = .black
            RootRouter().presentRootScreen(in: window)
        }
    }

    @objc internal func _reboot() {
        RootRouter().setupAppRoot()
    }
    internal func _setupKeyboard() {
        IQKeyboardManager.shared.enable = true
    }
}
