//
//  CountryModel.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/26/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import Foundation
struct CountryCollection:Codable {
    let countryArray : Countries
}
struct Countries:Codable {
    let name:String
    let capital:String
    let population:Int
    let currencies: [CurrencyInfo]
    let flag: URL
}
struct CurrencyInfo:Codable {
    let name: String
    let symbol: String
}
