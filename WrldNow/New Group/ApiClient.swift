//
//  ApiClient.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/18/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import Foundation
final class PlacesApiClient {
    static func searchPlace(placekeyword:String,location:String,completionHandler: @escaping (AppError?,[PlaceAttributes]?) -> Void){
    let urlString = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(placekeyword)+in+\(location)&key=\(SecretKeys.APIKey)"
        NetworkHelper.performDataTask(urlString: urlString, httpMethod: "GET") { (error, data, response) in
            if let error = error {
                completionHandler(error,nil)
            }
            if let data = data{
                do{
                    let placeData = try JSONDecoder().decode(Places.self, from: data).results
                    completionHandler(nil,placeData)
                } catch{
                      completionHandler(AppError.decodingError(error),nil)
                }
              
            }
        }
    }
    
    static func getRelatedImages(placeKeyword:String,location:String, completionHandler: @escaping (AppError?,[PhotoLinks]?) -> Void){
        let urlString = "https://api.cognitive.microsoft.com/bing/v7.0/images/search?q=\(placeKeyword)+\(location)&subscription-key=2c6cb636ab61411eac5bf546b2ec0987"
        NetworkHelper.performDataTask(urlString: urlString, httpMethod: "GET") { (error, data, response) in
            if let error = error {
                completionHandler(error,nil)
            }
            if let data = data {
                do{
                    let relatedImages = try JSONDecoder().decode(RelatedPhotos.self, from: data).value
                       completionHandler(nil,relatedImages)
                }catch{
                    completionHandler(AppError.decodingError(error),nil)
                }
             
            }
        }
    }
    static func getCountryData(continentKeyword:String, completionHandler:@escaping(AppError?,[Countries]?) -> Void){
        
        let urlString = "https://restcountries.eu/rest/v2/region/\(continentKeyword)"
        NetworkHelper.performDataTask(urlString: urlString, httpMethod: "GET") { (error, data, response) in
            if let error = error {
                completionHandler(error,nil)
            }
            if let data = data {
                do{
                    let countries = try JSONDecoder().decode([Countries].self, from: data)
                    completionHandler(nil,countries)
                } catch{
                 completionHandler(AppError.decodingError(error),nil)
                }
            }
            if let response = response {
                print(response)
            }
        }
    }
}
