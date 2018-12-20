//
//  RelatedPhotosModel.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/20/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import Foundation
struct RelatedPhotos:Codable{
    let value:[PhotoLinks]?
}
struct PhotoLinks:Codable {
    let contentUrl:String
}
