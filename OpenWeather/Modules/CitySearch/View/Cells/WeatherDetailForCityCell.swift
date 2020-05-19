//
//  WeatherDetailForCityCell.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import UIKit

class WeatherDetailForCityCell: BaseTableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var minTempVal: UILabel!
    @IBOutlet weak var maxTempVal: UILabel!
    @IBOutlet weak var windSpeedVal: UILabel!
    @IBOutlet weak var discriptionVal: UILabel!
    @IBOutlet weak var nameValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateCell(rowModel: BaseRowModel) {
        guard let cityInfo = rowModel.rowValue as? CityWeatherResultModel else{return}
        minTempVal.text = String(format: "%.2f F", cityInfo.main?.temp_min ?? 0.0)
        maxTempVal.text = String(format: "%.2f F", cityInfo.main?.temp_max ?? 0.0)
        windSpeedVal.text = String(format: "%.2f KM/H", cityInfo.wind?.speed ?? 0.0)
        var desc = ""
        for line in cityInfo.weather ?? []{
            desc += (" " + (line.description ?? ""))
        }
        desc = desc.trimmingCharacters(in: CharacterSet(charactersIn: " "))
        discriptionVal.text = "Description: " + desc.capitalized
        nameValue.text = (cityInfo.name?.capitalized ?? "--")
    }
    
}
