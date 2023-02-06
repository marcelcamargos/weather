//
//  WeatherPresenterTests.swift
//  WeatherTests
//
//  Created by Marcel Camargos on 05/02/23.
//

import XCTest
@testable import Weather

final class WeatherPresenterTests: XCTestCase {
    
    // MARK: - System under test
    
    var sut: WeatherPresenterDelegate?
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        let weatherViewController = WeatherViewController()
        sut = WeatherPresenter(weatherViewController)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test Mock
    
    class WeatherViewControllerSpy: WeatherViewControllerDelegate {
        // MARK: Method call expectations
        
        var displaySuccessShowWeatherCalled = false
        var displayFailShowWeatherCalled = false

        var displaySuccessShowIconCalled = false
        var displayFailShowIconCalled = false
        
        // MARK: Argument expectations
        
        var viewModel: WeatherModel.ViewModel?
        var errorWeatherMessage: String?

        var iconViewModel: IconModel.ViewModel?
        var errorIconMessage: String?
        
        // MARK: WeatherViewControllerDelegate
        
        func presenter(didSuccessShowWeather viewModel: WeatherModel.ViewModel) {
            displaySuccessShowWeatherCalled = true
            self.viewModel = viewModel
        }
        
        func presenter(didFailShowWeather message: String) {
            displayFailShowWeatherCalled = true
            self.errorWeatherMessage = message
        }
        
        func presenter(didSuccessShowIcon presenterToView: IconModel.ViewModel) {
            displaySuccessShowIconCalled = true
            self.iconViewModel = presenterToView
        }
        
        func presenter(didFailShowIcon message: String) {
            displayFailShowIconCalled = true
            self.errorIconMessage = message
        }
    }
    
    // MARK: - Tests
    
    func testPresentSuccessShowWeather() {
        //Given
        let weatherViewControllerSpy = WeatherViewControllerSpy()
        sut = WeatherPresenter(weatherViewControllerSpy)
        let weather = Seeds.Weat.weather
        
        //When
        let response = WeatherModel.Response(weather: weather)
        sut?.interactor(didSuccessShowWeather: response)
        
        //Then
        let weatherDetailViewModel = weatherViewControllerSpy.viewModel
        XCTAssertEqual(weatherDetailViewModel?.weather.title, "Toronto", "Weather city name should be Toronto")
        XCTAssertEqual(weatherDetailViewModel?.weather.consolidated_weather[3].the_temp, 21.95, "Current temperature should be 21.95")
        XCTAssertEqual(weatherDetailViewModel?.weather.consolidated_weather[3].min_temp, 15.685, "Min temperature should be 15.685")
        XCTAssertEqual(weatherDetailViewModel?.weather.consolidated_weather[3].max_temp, 21.355, "Max temperature should be 21.355")
    }
    
    func testPresentFailShowWeather() {
        //Given
        let weatherViewControllerSpy = WeatherViewControllerSpy()
        sut = WeatherPresenter(weatherViewControllerSpy)
        
        //When
        sut?.interactor(didFailShowWeather: "Fail present weather detail")
        
        //Then
        let errorMessageWeatherDetail = weatherViewControllerSpy.errorWeatherMessage
        XCTAssertEqual(errorMessageWeatherDetail, "Fail present weather detail", "Weather detail error message should be 'Fail present weather detail'")
    }
    
    func testPresentWeatherDetailShouldAskViewControllerToDisplayWeatherInformation() {
        // Given
        let weatherViewControllerSpy = WeatherViewControllerSpy()
        sut = WeatherPresenter(weatherViewControllerSpy)
        let weather = Seeds.Weat.weather
        
        // When
        let response = WeatherModel.Response(weather: weather)
        sut?.interactor(didSuccessShowWeather: response)
        
        // Then
        XCTAssert(weatherViewControllerSpy.displaySuccessShowWeatherCalled, "Presenting details should ask view controller to display it")
    }
}
