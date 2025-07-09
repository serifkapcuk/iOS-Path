//
//  ForecastCell.swift
//  WeatherAppv2
//
//  Created by Şerif Botan Kapcuk on 8.07.2025.
//

import UIKit

class ForecastTableCell: UITableViewCell {
  
    @IBOutlet  var dayLabel: UILabel!
    @IBOutlet  var tempLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
