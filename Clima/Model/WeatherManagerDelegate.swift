//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Shanmukha on 20/07/23.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}
