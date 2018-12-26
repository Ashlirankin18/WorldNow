//
//  CountryViewController.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/25/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    
    var countries = [Country]()
    var continentName = String()
    var continent: Continent! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCountries(keyWord: "africa")
    }
    
    func getCountries(keyWord:String){
        PlacesApiClient.getCountryData(continentKeyword: keyWord) { (error, countries) in
            if let error = error {
                print(error.errorMessage())
            }
            if let countries = countries {
                self.countries = countries
                dump(countries)
            }
        }
    }

}
extension ContinentViewController:UICollectionViewDelegate {
    
}
extension ContinentViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as? CountryCollectionViewCell else {fatalError("No cell found")}
    
    return cell
    }
    
    
}
