//
//  PlacesModel.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/18/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//
import Foundation

struct Places:Codable {
    let results: [PlaceAttributes]
}
struct PlaceAttributes:Codable {
    let formatted_address: String
    let geometry: Location
    let icon: String
    let name:String
    let opening_hours: IsOpen?
    let photos: [PhotoInfo]?
    let price_level: Int?
    let rating: Double
    let types: [String]
}
struct Location:Codable {
    let location: Coordinates
    let viewport: CompassPoint
}
struct Coordinates:Codable {
    let lat:Double
    let long:Double?
}
struct CompassPoint:Codable{
    let northeast: Coordinates
    let southwest: Coordinates
}
struct IsOpen:Codable {
    let open_now: Bool
}
struct PhotoInfo:Codable {
    let height: Int
    let html_attributions: [String]?
    let photo_reference: String?
    let width:Int
}
