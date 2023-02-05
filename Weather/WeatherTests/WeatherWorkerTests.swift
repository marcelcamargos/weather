//
//  WeatherWorkerTests.swift
//  WeatherTests
//
//  Created by Marcel Camargos on 05/02/23.
//

@testable import Weather
import XCTest

class WeatherWorkerTests: XCTestCase {
    
    // MARK: - System under test
    
    var sut: WeatherWorkerDelegate?
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        let weatherNetworkServiceDatasource: WeatherNetworkServiceDatasource = WeatherNetworkService()
        sut = WeatherWorker(weatherNetworkServiceDatasource)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test Mock
    
    class WeatherNetworkServiceSuccessSpy: WeatherNetworkServiceDatasource {
        
        // MARK: Method call expectations
        
        var getWeatherCalled = false
        
        // MARK: Argument expectations

        var weather: Weather = Seeds.Weat.weather
        
        // MARK: Spied methods
        func getWeather(success: @escaping (Weather) -> (), fail: @escaping (String) -> ()) {
            getWeatherCalled = true
            success(weather)
        }
    }
    
    class WeatherNetworkServiceErrorFailSpy: WeatherNetworkServiceDatasource {
        
        // MARK: Method call expectations
        
        var getWeatherCalled = false
        
        // MARK: Argument expectations

        var weather: Weather?
        
        // MARK: Spied methods
        func getWeather(success: @escaping (Weather) -> (), fail: @escaping (String) -> ()) {
            getWeatherCalled = true
            fail("Error with fetching weather")
        }
    }
    
    class WeatherNetworkServiceCodeFailSpy: WeatherNetworkServiceDatasource {
        
        // MARK: Method call expectations
        
        var getWeatherCalled = false
        
        // MARK: Argument expectations

        var weather: Weather?
        
        // MARK: Spied methods
        func getWeather(success: @escaping (Weather) -> (), fail: @escaping (String) -> ()) {
            getWeatherCalled = true
            fail("Error with the response, unexpected status code")
        }
    }
    
    // MARK: - Tests
    
    func testWeatherWorkerShouldReturnWeather() {
        // Given
        let serviceSpy = WeatherNetworkServiceSuccessSpy()
        sut = WeatherWorker(serviceSpy)
        
        // When
        var loggedWeather: Weather?
        let expect = expectation(description: "Wait for weather to return")
        
        sut?.getWeather(success: { (weather) in
            loggedWeather = weather
            expect.fulfill()
        }, fail: { (response) in
            
        })
        waitForExpectations(timeout: 1.1)
        
        //Then
        XCTAssertEqual(loggedWeather?.title, "Toronto", "logged weather title should be Toronto")
    }
    
    func testWeatherWorkerErrorFail() {
        // Given
        let serviceSpy = WeatherNetworkServiceErrorFailSpy()
        serviceSpy.weather = Seeds.Weat.weather

        sut = WeatherWorker(serviceSpy)

        // When
        var weatherError: String?
        let expect = expectation(description: "Wait for weather to return")

        sut?.getWeather(success: { (weather) in

        }, fail: { (message) in
            weatherError = message
            expect.fulfill()
        })
        waitForExpectations(timeout: 1.1)

        //Then
        XCTAssertEqual(weatherError, "Error with fetching weather", "error message should be 'Error with fetching weather'")
    }
    
    func testWeatherWorkerCodeFail() {
        // Given
        let serviceSpy = WeatherNetworkServiceCodeFailSpy()
        serviceSpy.weather = Seeds.Weat.weather

        sut = WeatherWorker(serviceSpy)

        // When
        var weatherCodeError: String?
        let expect = expectation(description: "Wait for weather to return")

        sut?.getWeather(success: { (weather) in

        }, fail: { (message) in
            weatherCodeError = message
            expect.fulfill()
        })
        waitForExpectations(timeout: 1.1)

        //Then
        XCTAssertEqual(weatherCodeError, "Error with the response, unexpected status code", "error message should be 'Error with the response, unexpected status code'")
    }
}
