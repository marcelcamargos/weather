//
//  WeatherInteractorTests.swift
//  WeatherTests
//
//  Created by Marcel Camargos on 05/02/23.
//

import XCTest
@testable import Weather

final class WeatherInteractorTests: XCTestCase {
    
    // MARK: - System under test
    
    var sut: WeatherInteractorDelegate?
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        let weatherViewController = WeatherViewController()
        let presenter = WeatherPresenter(weatherViewController)
        sut = WeatherInteractor(presenter)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test Mock
    
    class WeatherPresenterSpy: WeatherPresenterDelegate {
    
        // MARK: Method call expectations
        
        var presentWeatherCalled = false
        
        // MARK: Argument expectations

        var responseTest: WeatherModel.Response?
        var errorMessageTest: String?
        
        // MARK: WeatherPresenterDelegate
        
        func interactor(didSuccessShowWeather response: WeatherModel.Response) {
            presentWeatherCalled = true
            responseTest = response
        }
        
        func interactor(didFailShowWeather error: String) {
            presentWeatherCalled = true
            errorMessageTest = error
        }
    }
    
    class WeatherWorkerSuccessSpy: WeatherWorkerDelegate {
        
        // MARK: Method call expectations
        
        var weatherDetailCalled = false
        
        // MARK: Spied methods
        func getWeather(success: @escaping (Weather) -> (), fail: @escaping (String) -> ()) {
            weatherDetailCalled = true
            success(Seeds.Weat.weather)
        }
    }

    class WeatherWorkerFailSpy: WeatherWorkerDelegate {
        // MARK: Method call expectations
        
        var weatherDetailCalled = false
        
        // MARK: Spied methods
        
        func getWeather(success: @escaping (Weather) -> (), fail: @escaping (String) -> ()) {
            weatherDetailCalled = true
            fail("Fail to show weather detail")
        }
    }
    
    class IconWorkerSuccessSpy: IconWorkerDelegate {
        // MARK: Method call expectations
        
        var iconDetailCalled = false
        
        // MARK: Spied methods
        func getIcon(weather_state_abbr: String, success: @escaping (UIImage) -> (), fail: @escaping (String) -> ()) {
            iconDetailCalled = true
            success(UIImage())
        }
    }

    class IconWorkerFailSpy: IconWorkerDelegate {
        // MARK: Method call expectations
        
        var iconDetailCalled = false
        
        // MARK: Spied methods
        
        func getIcon(weather_state_abbr: String, success: @escaping (UIImage) -> (), fail: @escaping (String) -> ()) {
            iconDetailCalled = true
            fail("Fail to show icon")
        }
    }
    
    // MARK: - Test login
    
    func testWeatherDetailSuccess() {
        // Given
        let weatherPresenterSpy = WeatherPresenterSpy()
        let weatherWorkerSuccessSpy = WeatherWorkerSuccessSpy()
        let iconWorkerSuccessSpy = IconWorkerSuccessSpy()

        sut = WeatherInteractor(weatherPresenterSpy, weatherWorkerSuccessSpy, iconWorkerSuccessSpy)
        
        // When
        sut?.fetchWeather()
        
        // Then
        let response = weatherPresenterSpy.responseTest
        XCTAssertEqual(response?.weather.title, "Toronto", "Response weather detail name should be Toronto")
        XCTAssertEqual(response?.weather.consolidated_weather[3].weather_state_name, "Light Cloud", "Response weather detail name should be Light Cloud")
        
        XCTAssert(weatherPresenterSpy.presentWeatherCalled, "Interactor should ask presenter to show weather information")
        XCTAssert(weatherWorkerSuccessSpy.weatherDetailCalled, "WeatherWorker should be called")
        XCTAssert(iconWorkerSuccessSpy.iconDetailCalled, "IconWorker should be called")
    }
    
    func testWeatherDetailFail() {
        // Given
        let weatherPresenterSpy = WeatherPresenterSpy()
        let weatherWorkerSuccessSpy = WeatherWorkerFailSpy()
        let iconWorkerSuccessSpy = IconWorkerFailSpy()

        sut = WeatherInteractor(weatherPresenterSpy, weatherWorkerSuccessSpy, iconWorkerSuccessSpy)
        
        // When
        sut?.fetchWeather()

        // Then
        XCTAssert(weatherPresenterSpy.presentWeatherCalled, "Weather present should be called")
        XCTAssertEqual(weatherPresenterSpy.errorMessageTest, "Fail to show weather detail", "weather detail message error should be 'Fail to show weather detail'")
        XCTAssertNil(weatherPresenterSpy.responseTest, "Response should be nil in weather detail fail")
    }
}
