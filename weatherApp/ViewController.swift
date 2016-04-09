//
//  ViewController.swift
//  weatherApp
//
//  Created by Christella on 3/30/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var currentWeatherStatusLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var minMaxTempLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var chanceOfRainLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var weather = Weather(latitude: 40.838252, longitude: -73.856609)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        
        
        
        collection.delegate = self
        collection.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        
        weather.downloadWeatherDetails { () -> () in
            self.updateUI()
            self.collection.reloadData()
            self.tableView.reloadData()
        }
        
    }
    
    func updateUI() {
        currentWeatherStatusLbl.text = weather.weatherSummary
        currentTempLbl.text = "\(Int(weather.currentTemperature))°"
        minMaxTempLbl.text = "\(Int(weather.temperatureMin))° / \(Int(weather.temperatureMax))°"
        windSpeedLbl.text = "Wind: \(Int(weather.windSpeed)) MPH"
        chanceOfRainLbl.text = "Chance of Rain: \(Int(weather.precipProbability)) %"
        
    }
    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HourlyWeatherCell", forIndexPath: indexPath) as? HourlyWeatherCell {
            
            let hourlyForecast: String!
            var hourlyTemp: Float!
            let hourIcon: String!
            
            hourlyForecast = self.weather.hour[indexPath.row]
            hourlyTemp = self.weather.hourTemperature[indexPath.row]
            hourIcon = self.weather.hourIcon[indexPath.row]
            cell.configureCell(hourlyForecast, temp: hourlyTemp, icon: hourIcon)
            
            
            return cell
        } else {
            
            return UICollectionViewCell()
        }
    
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      
        return self.weather.hour.count

        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(90, 90)
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("WeeklyWeatherCell") as? WeeklyWeatherCell {
            
            let weekday = self.weather.dayOfWeek[indexPath.row]
            let tempMin = self.weather.dailyTemperatureMin[indexPath.row]
            let tempMax = self.weather.dailyTemperatureMax[indexPath.row]
            let icon = self.weather.dailyIcon[indexPath.row]
            
            cell.configureCell(weekday, tempMin: tempMin, tempMax: tempMax, dailyIcon: icon)
            
            return cell
                
            } else {
                return WeeklyWeatherCell()
            }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weather.dayOfWeek.count
    }
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("location:: \(location)")
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error:: \(error)")
    }
}





