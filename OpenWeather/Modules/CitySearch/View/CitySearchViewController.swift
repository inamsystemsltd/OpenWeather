//
//  CitySearchViewController.swift
//  OpenWeather
//
//  Created by Inam Ur Rahman on 19/05/2020.
//  Copyright © 2020 Inam Ur Rahman. All rights reserved.
//

import Foundation
import UIKit

class CitySearchViewController: BaseViewController {
    
    // MARK: Properties
    
    var presenter: CitySearchPresentation?
    var rowModels = [BaseRowModel]()
    
    // MARK: - IBActions
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performInitialSetup()
    }
    
    func performInitialSetup(){
        title = "City search"
        searchBar.searchTextField.delegate = self
        tableView.register(UINib(nibName: "WeatherDetailForCityCell", bundle: nil), forCellReuseIdentifier: "WeatherDetailForCityCell")
    }
}

extension CitySearchViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        presenter?.fetchWeatherDetails(citiesString: searchText)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        presenter?.fetchWeatherDetails(citiesString: searchBar.text ?? "")
    }
}

extension CitySearchViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension CitySearchViewController: CitySearchView {
    func showError(errorString: String) {
        showAlertWith(message: errorString) { (action) in
        }
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func citiesWeatherDetailsRowModelsReceived(rowModels: [BaseRowModel]) {
        self.rowModels = rowModels
        tableView.reloadData()
    }
}

extension CitySearchViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = rowModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: item.rowCellIdentifier) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(rowModel: item)
        return cell
        
    }
}
