//
//  PlacesDetailledViewController.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/18/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import UIKit
class PlacesDetailledViewController: UIViewController {
    @IBOutlet weak var relatedImagesCollectionView: UICollectionView!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeDetail3: UILabel!
    @IBOutlet weak var placeDetail4: UILabel!
    @IBOutlet weak var placeDetail5: UILabel!
   var index = 0
    var image = UIImage()
    var relatedImages = [PhotoLinks]() {
        didSet{
            DispatchQueue.main.async {
                self.relatedImagesCollectionView.reloadData()
            }
        }
    }
    public var place: PlaceAttributes!
    override func viewDidLoad() {
        super.viewDidLoad()
        getCollectionViewData()
        updateTheUi()
        relatedImagesCollectionView.dataSource = self
    }
    private func getImage(){
        var urlString = String()
        if let photoInfo = place.photos?[index]{
            urlString = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=\(photoInfo.width)&photoreference=\(photoInfo.photo_reference!)&key=\(SecretKeys.APIKey)"
        }
        ImageHelper.fetchImage(urlString: urlString ) { (error, image) in
            if let error = error {
                print(error.errorMessage())
            }
            if let image = image {
                self.placeImage.image = image
                self.index += 1
            }
        }
    }
    func getCollectionViewData(){
        PlacesApiClient.getRelatedImages(placeKeyword: "Park", location: "NewYork") { (error, data) in
            if let error = error{
                print(error.errorMessage())
            }
            if let data = data{
                self.relatedImages = data
                
            }
        }
    }
    private func updateTheUi(){
        getImage()
        placeDetail5.text = place.name
        placeDetail4.text = place.formatted_address
        if place.opening_hours != nil {
            placeDetail3.text = "Currently Open: \(place.opening_hours?.open_now ?? false)"
            
        } else {
            placeDetail3.text = "This location has no known opening hours at this time."
        }
    }
}
