//
//  BaseTableViewCell.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    func updateCell(rowModel: BaseRowModel) {
        preconditionFailure("You have to override updateCell")
    }
}
