//
//  WeatherManager.swift
//  Clima
//
//  Created by Shanmukha on 20/07/23.
//

import Foundation

struct WeatherManager {
    // TODO: Fill the below constant with your own OpenWeatherMap api key
    // https://home.openweathermap.org/api_keys
    let openWeatherMapAPIKey = ""
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=%@&units=metric&city=%@"
    
    func fetchWeather(city: String) {
        let urlString = String(format: self.weatherUrl, self.openWeatherMapAPIKey, city)
        print(urlString)
    }
}
