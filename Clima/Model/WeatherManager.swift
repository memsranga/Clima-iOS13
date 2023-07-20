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
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=%@&units=metric&q=%@"
    
    var delegate: WeatherManagerDelegate? = nil
    
    func fetchWeather(city: String) {
        let urlString = String(format: self.weatherUrl, self.openWeatherMapAPIKey, city)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url, completionHandler: self.handleResponse)
            dataTask.resume()
        }
    }
    
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            print(error)
            return
        }
        
        if let data = data {
            if let weather = self.parseJSON(weatherData: data) {
                self.delegate?.didUpdateWeather(weather: weather)
            }
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let weather = WeatherModel(city: decodedData.name, temperature: decodedData.main.temp, conditionId: decodedData.weather[0].id)
            return weather
        } catch {
            print(error)
            // need to return error as well
            // so the ViewController can handle it better
            return nil
        }
    }
}
