//
//  Weather.swift
//  weatherApp
//
//  Created by Christella on 4/2/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    private var _city: String!
    private var _latitude: Float!
    private var _longitude: Float!
    
    private var _weatherSummary: String!
    private var _currentTemperature: Float!
    private var _temperatureMin: Float!
    private var _temperatureMax: Float!
    private var _windSpeed: Float!
    private var _precipProbability: Float!
    
    private var _hour: Int!
    private var _hourTemperature: Float!
    private var _hourIcon: String!
    
    private var _dailyTime: Int!
    private var _dailyTemperatureMin: Float!
    private var _dailyTemperatureMax: Float!
    private var _dailyIcon: String!
    
    private var _forecastURL: String!

    var weatherSummary: String {
        return _weatherSummary
    }
    
    var currentTemperature: Float {
        return _currentTemperature
    }
    
    var temperatureMin: Float {
        return _temperatureMin
    }
    
    var temperatureMax: Float {
        return _temperatureMax
    }
    
    var windSpeed: Float {
        return _windSpeed
    }
    
    var precipProbability: Float {
        return _precipProbability
    }
    
    init(latitude: Float, longitude: Float) {
        self._latitude = latitude
        self._longitude = longitude
        
        _forecastURL = "\(URL_BASE)\(URL_WEATHER)\(self._latitude),\(self._longitude)"
        
        print(_forecastURL)
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        let url = NSURL(string: _forecastURL)!
        
            Alamofire.request(.GET, url).responseJSON { response in
                let result = response.result
                
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    if let currentForecast = dict["currently"] as? Dictionary<String, AnyObject> {
                        if let summary = currentForecast["summary"] as? String {
                            self._weatherSummary = summary
                        }
                        
                        if let currentTemperature = currentForecast["temperature"] as? Float {
                            self._currentTemperature = currentTemperature
                        }
                        
                        if let windSpeed = currentForecast["windSpeed"] as? Float {
                            self._windSpeed = windSpeed
                        }
                        
                        if let precipProbability = currentForecast["precipProbability"] as? Float {
                            self._precipProbability = precipProbability
                        }
                        
                        
                        // todays/current weather
                        print(self._weatherSummary)
                        print(self._currentTemperature)
                        print(self._windSpeed)
                        print(self._precipProbability)
                    
                        if let dailyDict = dict["daily"] as? Dictionary<String,AnyObject> {
                            if let dailyForecast = dailyDict["data"] as? [Dictionary<String, AnyObject>] where dailyForecast.count > 0 {
                                
                                    if let todaysTempMin = dailyForecast[0]["temperatureMin"] as? Float {
                                        self._temperatureMin = todaysTempMin
                                    }
                                
                                    if let todaysTempMax = dailyForecast[0]["temperatureMax"] as? Float {
                                        self._temperatureMax = todaysTempMax
                                    }
                                
                                // todays/current forecast
                                print(self._temperatureMin)
                                print(self._temperatureMax)
                                
                                //getting weekly forecast
                                for x in 1...dailyForecast.count-1 {
                                    if let timestamps = dailyForecast[x]["time"] as? Int {
                                    
                                        print(timestamps)
                                    
                                    }
                                    
                                    if let dailyTempMin = dailyForecast[x]["temperatureMin"] as? Float {
                                        
                                        print(dailyTempMin)
                                    }
                                    
                                    if let dailyTempMax = dailyForecast[x]["temperatureMax"] as? Float {
                                        
                                        print(dailyTempMax)
                                    }
                                    
                                    if let dailyIcon = dailyForecast[x]["icon"] as? String {
                                    
                                        print(dailyIcon)
                                    }
                                }
                            }
                        }
                        
                        if let hourlyDict = dict["hourly"] as? Dictionary<String,AnyObject> {
                            if let hourlyForecast = hourlyDict["data"] as? [Dictionary<String, AnyObject>] where hourlyForecast.count > 0 {
                                for j in 0...hourlyForecast.count-1 {
                                    if let hour = hourlyForecast[j]["time"] as? Int {
                                        
                                        print(hour)
                                    }
                                    if let hourIcon = hourlyForecast[j]["icon"] as? String {
                                        
                                        print(hourIcon)
                                    }
                                    if let hourTemp = hourlyForecast[j]["temperature"] as? Float {
                                        
                                        print(hourTemp)
                                    }
                                }
                            }
                        }
                    }
                }
            }
    }
}