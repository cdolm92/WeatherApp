//
//  WeeklyWeatherCell.swift
//  weatherApp
//
//  Created by Christella on 4/7/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import UIKit

class WeeklyWeatherCell: UITableViewCell {
    
    @IBOutlet weak var dayOfWeekLbl: UILabel!
    
    var weekDay: String!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(day: String) {
        self.weekDay = day
        
        dayOfWeekLbl.text = self.weekDay
    }

}
