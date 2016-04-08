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
    @IBOutlet weak var hourIconImage: UIImageView!
    
    var hour: String!
    var temp: Float!
    var hourIcon: String!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer .cornerRadius = 2.5
    }
    
    func configureCell(hour: String, temp: Float, icon: String) {
        
        
        self.hour = hour
        
        hourLbl.text = self.hour
       
        self.temp = temp
       
        TempLbl.text = "\(Int(self.temp))°"
        
        self.hourIcon = icon
        hourIconImage.image = UIImage(named: "\(self.hourIcon)")
    
    }
    
    
}
