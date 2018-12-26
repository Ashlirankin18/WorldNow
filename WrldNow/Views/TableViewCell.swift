//
//  TableViewCell.swift
//  WrldNow
//
//  Created by Ashli Rankin on 12/25/18.
//  Copyright © 2018 Ashli Rankin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var continentImage: UIImageView!
    @IBOutlet weak var continentName: UILabel!
    @IBOutlet weak var numberOfCountries: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
