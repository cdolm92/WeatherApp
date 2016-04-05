//
//  hourlyWeatherCell.swift
//  weatherApp
//
//  Created by Christella on 4/3/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import UIKit

class HourlyWeatherCell: UICollectionViewCell {
    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var TempLbl: UILabel!
    
    var weather: String!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer .cornerRadius = 2.5
    }
    
    func configureCell(weather: String) {
        
        
        self.weather = weather
        
        hourLbl.text = self.weather
        
       
        TempLbl.text = "nice"
    
    }
    
    
}
