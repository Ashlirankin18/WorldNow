//
//  CountryViewController.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/25/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import UIKit
import WebKit 
class CountryViewController: UIViewController {
    @IBOutlet weak var countryCollectionView: UICollectionView!
    
private var countries = [Countries]() {
        didSet {
            DispatchQueue.main.async {
                self.countryCollectionView.reloadData()
            }
        }
    }
var continentName = String()
var keyword = String()
var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
         getCountries(keyWord: getACountry())
        countryCollectionView.dataSource = self
       
    }
    func getACountry() -> String{
        switch continentName {
        case "Asia":
            keyword = "Asia"
        case "Africa":
            keyword = "Africa"
        case "Americas":
            keyword = "Americas"
        case "Oceania":
            keyword = "Oceania"
        case "Europe":
            keyword = "Europe"
        default :
            print("Invalid")
        }
        return keyword
    }
   private func getCountries(keyWord:String){
        PlacesApiClient.getCountryData(continentKeyword: keyword) { (error, countries) in
            if let error = error {
                print(error.errorMessage())
            }
            if let countries = countries {
                self.countries = countries
                dump(countries)
            }
        }
    }
    private func getImage(urlString:String) -> UIImage?{
        var myImage: UIImage?
        ImageHelper.fetchImage(urlString: urlString) { (error, image) in
            if let error = error{
                print(error.errorMessage())
                
            }
            if let image = image {
                myImage = image
                
            }
            
        }
        return myImage
    }
}

extension CountryViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let country = countries[indexPath.row]
        guard let currency = country.currencies?[indexPath.section] else {fatalError()}
        guard let cell = countryCollectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as? CountryCollectionViewCell else {fatalError("No cell found")}
       cell.countryName.text = country.name
        cell.countryPopulation.text = "Population: \(country.population)"
        if let currencyName = currency.name ,
            let currencySymbol = currency.symbol {
            cell.countryCurrency.text = "\(currencySymbol) \(currencyName)"
           // cell.countryFlag.image = getImage(urlString: country.flag)
         
        }
        return cell
    }
}
