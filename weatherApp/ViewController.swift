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
    
    var stuff = ["thing1", "thing2", "thing3", "thing4", "thing5", "thing6", "thing7"]
   // var hoursArr = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
        weather.downloadWeatherDetails { () -> () in
            self.updateData()
            self.updateUI()
        }
     
        
    }
    
    func updateUI() {
        currentWeatherStatusLbl.text = weather.weatherSummary
        
    }
    
    func updateData() {
       // self.hoursArr = self.weather.hour
        
        print("hoursARR: \(self.weather.hour)")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HourlyWeatherCell", forIndexPath: indexPath) as? HourlyWeatherCell {
            
            let hourlyForecast: String!
            
            hourlyForecast = self.stuff[indexPath.row]
            cell.configureCell(hourlyForecast)
            
            
            return cell
        } else {
            
            return UICollectionViewCell()
        }
    
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        

      print(self.stuff.count)
        return self.stuff.count
        //self.weather.hour.count
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(100, 100)
        
    }
}





