//
//  Constants.swift
//  weatherApp
//
//  Created by Christella on 4/3/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import Foundation

let URL_BASE = "https://api.forecast.io"
let API_KEY = "31706003c47eda54bf750cbd568bc9f5"
let URL_WEATHER = "/forecast/\(API_KEY)/"

typealias DownloadComplete = () -> ()