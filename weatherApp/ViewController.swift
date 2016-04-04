//
//  ViewController.swift
//  weatherApp
//
//  Created by Christella on 3/30/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var currentWeatherStatusLbl: UILabel!
    
    
    var weather = Weather(latitude: 40.838252, longitude: -73.856609)
    var hoursArr = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        weather.downloadWeatherDetails { () -> () in
            self.updateData()
            self.updateUI()
        }
        
//        for x in 0...self.weather.hour.count {
//            forecast.append("\(x)")
//        }
    
//
        
        
    }
    
    func updateUI() {
        currentWeatherStatusLbl.text = weather.weatherSummary
        
    }
    
    func updateData() {
        self.hoursArr = self.weather.hour
        
        print("hoursARR: \(self.hoursArr)")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HourlyWeatherCell", forIndexPath: indexPath) as? HourlyWeatherCell {
            
            let hourlyForecast: String!
            
            hourlyForecast = self.hoursArr[indexPath.row]
            cell.configureCell(hourlyForecast)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hoursArr.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(100, 100)
        
    }
}





