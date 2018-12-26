//
//  ContinentModel.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/25/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import UIKit
class Continent {
    var name:String
    var image:UIImage
    var numberOfCountries:Int
    init (name:String,image:UIImage,numberOfCountries:Int){
        self.name = name
        self.image = image
        self.numberOfCountries = numberOfCountries
    }


static let continents: [Continent] = [Continent.init(name: "Asia", image: #imageLiteral(resourceName: "AsiaCountries.jpg"), numberOfCountries: 48),Continent.init(name: "Africa", image: #imageLiteral(resourceName: "AfricaCountries.png"), numberOfCountries: 54),Continent.init(name: "Europe", image: #imageLiteral(resourceName: "europeCountries.jpg"), numberOfCountries: 51),Continent.init(name: "Americas", image: #imageLiteral(resourceName: "vector-illustration-north-south-america-map-country-names-flags-countries-maps-109588842.jpg") , numberOfCountries: 45),Continent.init(name: "Oceania", image: #imageLiteral(resourceName: "oceania-polynesia.jpg"), numberOfCountries: 3)]
}
