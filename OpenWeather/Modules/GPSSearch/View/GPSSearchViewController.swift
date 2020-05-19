//
//  GPSSearchViewController.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import UIKit

class GPSSearchViewController: BaseViewController {

    // MARK: Properties

    var presenter: GPSSearchPresentation?
    var sectionsRowModels = [SectionRowModel]()
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        performInitialSetup()
        presenter?.requestLocationPermission()
    }
    
    func performInitialSetup(){
        title = "GPS search"
        tableView.register(UINib(nibName: "WeatherDetailForGPSCell", bundle: nil), forCellReuseIdentifier: "WeatherDetailForGPSCell")
    }
}

extension GPSSearchViewController: GPSSearchView {
    func weatherDetailRowModelsReceived(rowModels: [SectionRowModel]) {
        self.sectionsRowModels = rowModels
        tableView.reloadData()
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showError(error: String) {
        showAlertWith(message: error) { (action) in
            
        }
    }
}

extension GPSSearchViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsRowModels[section].rowValues?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsRowModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = sectionsRowModels[indexPath.section].rowValues?[indexPath.row] as? BaseRowModel else {return UITableViewCell()}
        guard let cell = tableView.dequeueReusableCell(withIdentifier: item.rowCellIdentifier) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(rowModel: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsRowModels[section].title
    }
}
