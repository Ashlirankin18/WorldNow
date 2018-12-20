//
//  PlacesDisplayViewController.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/18/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import UIKit
import CoreLocation
class PlacesDisplayViewController: UIViewController {
    @IBOutlet weak var placesSearchBar: UISearchBar! //This search bar will search depending on services
    @IBOutlet weak var placesTableView: UITableView!
    var image = UIImage()
    private var places = [PlaceAttributes]() {
        didSet{
        DispatchQueue.main.async {
            self.placesTableView.reloadData()
        }
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        grabsTheData()
        placesTableView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = placesTableView.indexPathForSelectedRow,
        let DetailledViewController = segue.destination as? PlacesDetailledViewController else { fatalError("No Controller Found")}
       let place = places[indexPath.row]
        DetailledViewController.place = place
    }
    private func grabsTheData(){
        PlacesApiClient.searchPlace(placekeyword: "bank", location: "Bahamas") { (error, places) in
            if let error = error{
                print(error.errorMessage())
            }
            if let places = places {
                self.places = places
            }
        }
        
    }
    private func getPlaceIcon(indexPath:IndexPath) -> UIImage {
        ImageHelper.fetchImage(urlString: places[indexPath.row].icon) { (error, image) in
            if let error = error {
                print(error)
            }
            if let images = image {
            self.image = images
            }
        }
         return image
    }
   
}
extension PlacesDisplayViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = placesTableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].name
        cell.detailTextLabel?.text = places[indexPath.row].formatted_address 
        cell.imageView?.image = getPlaceIcon(indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
}
    

