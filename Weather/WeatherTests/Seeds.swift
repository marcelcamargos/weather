//
//  Seeds.swift
//  WeatherTests
//
//  Created by Marcel Camargos on 05/02/23.
//

@testable import Weather
import UIKit

struct Seeds {
    struct Consolidated {
        static let consolidatedWeather1 = ConsolidatedWeather(id:4805883302248448,
                                                      weather_state_name:"Light Rain",
                                                      weather_state_abbr:"lr",
                                                      wind_direction_compass:"WNW",
                                                      created:"2021-09-13T22:16:21.961506Z",
                                                      applicable_date:"2021-09-13",
                                                      min_temp:13.895,
                                                      max_temp:22.240000000000002,
                                                      the_temp:22.33,
                                                      wind_speed:5.6738177100135205,
                                                      wind_direction:287.33359156579274,
                                                      air_pressure:1018.5,
                                                      humidity:56,
                                                      visibility:14.006328044221744,
                                                      predictability:75)
        
        static let consolidatedWeather2 = ConsolidatedWeather(id:5028922455490560,
                                                              weather_state_name:"Light Rain",
                                                              weather_state_abbr:"lr",
                                                              wind_direction_compass:"S",
                                                              created:"2021-09-13T22:16:24.964788Z",
                                                              applicable_date:"2021-09-14",
                                                              min_temp:16.95,
                                                              max_temp:25.235,
                                                              the_temp:23.775,
                                                              wind_speed:8.71114908481402,
                                                              wind_direction:182.4690622725618,
                                                              air_pressure:1012.5,
                                                              humidity:74,
                                                              visibility:12.12854430128052,
                                                              predictability:75)
        
        static let consolidatedWeather3 = ConsolidatedWeather(id:6038117740969984,
                                                              weather_state_name:"Light Rain",
                                                              weather_state_abbr:"lr",
                                                              wind_direction_compass:"NW",
                                                              created:"2021-09-13T22:16:28.753685Z",
                                                              applicable_date:"2021-09-15",
                                                              min_temp:17.0,
                                                              max_temp:21.935000000000002,
                                                              the_temp:21.54,
                                                              wind_speed:6.2956524474747475,
                                                              wind_direction:316.263931494886,
                                                              air_pressure:1015.0,
                                                              humidity:65,
                                                              visibility:13.869626381929532,
                                                              predictability:75)
        
        static let consolidatedWeather4 = ConsolidatedWeather(id:6193240316313600,
                                                              weather_state_name:"Light Cloud",
                                                              weather_state_abbr:"lc",
                                                              wind_direction_compass:"E",
                                                              created:"2021-09-13T22:16:31.362832Z",
                                                              applicable_date:"2021-09-16",
                                                              min_temp:15.685,
                                                              max_temp:21.355,
                                                              the_temp:21.95,
                                                              wind_speed:6.689968536938944,
                                                              wind_direction:94.18194205759067,
                                                              air_pressure:1021.0,
                                                              humidity:65,
                                                              visibility:14.140233536148891,
                                                              predictability:70)
        
        static let consolidatedWeather5 = ConsolidatedWeather(id:6732261765414912,
                                                              weather_state_name:"Light Cloud",
                                                              weather_state_abbr:"lc",
                                                              wind_direction_compass:"S",
                                                              created:"2021-09-13T22:16:33.881626Z",
                                                              applicable_date:"2021-09-17",
                                                              min_temp:17.884999999999998,
                                                              max_temp:24.585,
                                                              the_temp:26.475,
                                                              wind_speed:5.497245860197778,
                                                              wind_direction:189.76390938564325,
                                                              air_pressure:1019.0,
                                                              humidity:71,
                                                              visibility:13.283362662053607,
                                                              predictability:70)
        
        static let all = [consolidatedWeather1, consolidatedWeather2, consolidatedWeather3, consolidatedWeather4, consolidatedWeather5]
    }
    
    struct Weat {
        static let parent = Parent(title: "Canada", location_type: "Country", woeid: 23424775, latt_long: "56.954681,-98.308968")
        
        static let source = Source(title: "BBC", slug: "bbc", url: "http://www.bbc.co.uk/weather/", crawl_rate: 360)
        
        static let sources = [source]
        
        static let weather = Weather(consolidated_weather: Consolidated.all, time: "2021-09-13T20:09:14.050321-04:00", sun_rise: "2021-09-13T06:54:56.500274-04:00", sun_set: "2021-09-13T19:30:52.466512-04:00", timezone_name: "LMT", parent: parent, sources: sources, title: "Toronto", location_type: "City", woeid: 4118, latt_long: "43.648560,-79.385368", timezone: "America/Toronto")
    }
}
