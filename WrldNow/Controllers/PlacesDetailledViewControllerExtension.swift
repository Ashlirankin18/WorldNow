//
//  PlacesDetailledViewControllerExtension.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/20/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import UIKit
extension PlacesDetailledViewController: UICollectionViewDataSource {
    public func getImageData(indexPath:IndexPath) -> UIImage {
        ImageHelper.fetchImage(urlString: relatedImages[indexPath.row].contentUrl) { (error, image) in
            if let image = image {
              self.image = image
            }
            if let error = error {
                print(error.errorMessage())
            }
        }
        return image
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return relatedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = relatedImagesCollectionView.dequeueReusableCell(withReuseIdentifier: "relatedImages", for:indexPath) as? relatedImages else {return UICollectionViewCell()}
        
        ImageHelper.fetchImage(urlString: relatedImages[indexPath.row].contentUrl) { (error, image) in
            if let image = image {
                cell.relatedImageView.image = image
            }
            if let error = error {
                print(error.errorMessage())
            }
        }
        return cell
    }
}
