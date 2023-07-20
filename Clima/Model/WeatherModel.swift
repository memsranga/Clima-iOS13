//
//  WeatherModel.swift
//  Clima
//
//  Created by Shanmukha on 20/07/23.
//

import Foundation

struct WeatherModel {
    let city: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", self.temperature)
    }
    
    let conditionId: Int
    var conditionName: String {
        return getConditionName(conditionId: self.conditionId)
    }
    
    func getConditionName(conditionId: Int) -> String {
        switch (conditionId) {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
