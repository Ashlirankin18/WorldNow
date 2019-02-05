//
//  ContinentViewController.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/25/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import UIKit

class ContinentViewController: UIViewController {

    @IBOutlet weak var continentTableView: UITableView!
    let continents = Continent.continents
    override func viewDidLoad() {
        super.viewDidLoad()
        continentTableView.dataSource = self
        continentTableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = continentTableView.indexPathForSelectedRow,
        let destination = segue.destination as? CountryViewController else {fatalError("No destination found")}
        destination.continentName = continents[indexPath.row].name
    }
}
extension ContinentViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let continent = continents[indexPath.row]
        guard let cell = continentTableView.dequeueReusableCell(withIdentifier: "continentCell",for:indexPath) as? TableViewCell else {fatalError(
            "No cell found")}
        cell.continentName.text =  continent.name
        cell.numberOfCountries.text = "Number of countries: \(continent.numberOfCountries)"
      //  cell.continentImage.image = continent.image
        return cell
    }
    
    
}
extension ContinentViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
