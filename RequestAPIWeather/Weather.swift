//
//  Weather.swift
//  RequestAPIWeather
//
//  Created by Apple on 4/16/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

typealias DICT = Dictionary<AnyHashable, Any>

class Weather {
    var arr = [Model_Forecast]()
    var name: String
    var country: String
    var temp_c: Double
    var wind_dir: String
    var text: String
    var icon: String
    var code: Int
    
    init?(dict: DICT) {
        guard let location = dict["location"] as? DICT else { return nil }
        guard let name = location["name"] as? String else { return nil }
        guard let country = location["country"] as? String
            else { return nil }
        guard let current = dict["current"] as? DICT else { return nil }
        guard let temp_c = current["temp_c"] as? Double else { return nil }
        guard let wind_dir = current["wind_dir"] as? String else { return nil }
        guard let condition = current["condition"] as? DICT else { return nil }
        guard let text = condition["text"] as? String else { return nil }
        guard let icon = condition["icon"] as? String else { return nil }
        guard let code = condition["code"] as? Int else { return nil }
        guard let forecast = dict["forecast"] as? DICT else { return nil }
        guard let forecastday = forecast["forecastday"] as? [DICT] else { return nil }
        for element_forecastday in forecastday {
            if let day = Model_Forecast(dict: element_forecastday) {
                arr.append(day)
            }
        }
        
        self.name = name
        self.country = country
        self.temp_c = temp_c
        self.wind_dir = wind_dir
        self.text = text
        self.icon = icon
        self.code = code
    }
}

class Model_Forecast {
    var date: String
    var text: String
    var icon: String
    var code: Int
    var sunrise: String
    var sunset: String
    var mooonrise: String
    var moonset: String
    
    init?(dict: DICT) {
        guard let date = dict["date"] as? String else { return nil }
        guard let day = dict["day"] as? DICT else { return nil }
        guard let condition = day["condition"] as? DICT else { return nil }
        guard let text = condition["text"] as? String else { return nil }
        guard let icon = condition["icon"] as? String else { return nil }
        guard let code = condition["code"] as? Int else { return nil }
        guard let astro = dict["astro"] as? DICT else { return nil }
        guard let sunrise = astro["sunrise"] as? String else { return nil }
        guard let sunset = astro["sunset"] as? String else { return nil }
        guard let moonrise = astro["moonrise"] as? String else { return nil }
        guard let moonset = astro["moonset"] as? String else { return nil }
        
        self.date = date
        self.text = text
        self.icon = icon
        self.sunrise = sunrise
        self.sunset = sunset
        self.moonset = moonset
        self.mooonrise = moonrise
        self.code = code
    }
}
