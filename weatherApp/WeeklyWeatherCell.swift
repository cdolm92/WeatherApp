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
    @IBOutlet weak var tempMinMaxLbl: UILabel!
    @IBOutlet weak var dailyIconImg: UIImageView!
    
    var weekDay: String!
    var tempMin: Float!
    var tempMax: Float!
    var dailyIcon: String!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(day: String, tempMin: Float, tempMax: Float, dailyIcon: String) {
        self.weekDay = day
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.dailyIcon = dailyIcon
        
        dayOfWeekLbl.text = self.weekDay
        tempMinMaxLbl.text = "\(Int(self.tempMin))° / \(Int(self.tempMax))°"
        dailyIconImg.image = UIImage(named: "\(self.dailyIcon)")
        
    }

}
