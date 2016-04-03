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
    
    private var _hourTime: Int!
    private var _hourlyTemperature: Float!
    
    private var _dailyTime: Int!
    private var _dailyTemperatureMin: Float!
    private var _dailyTemperatureMax: Float!
    
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
                        
                        print(self._weatherSummary)
                    }
                }
            }
    }
}