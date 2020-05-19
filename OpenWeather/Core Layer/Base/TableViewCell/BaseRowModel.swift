//
//  BaseRowModel.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import UIKit

class BaseRowModel: NSObject {
    var rowCellIdentifier = ""
    var rowValue: Any?
    var rowHeight: CGFloat = 0.0
    var rowWidth: CGFloat = 0.0
}
