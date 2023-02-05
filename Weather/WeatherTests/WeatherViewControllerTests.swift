//
//  WeatherViewControllerTests.swift
//  WeatherTests
//
//  Created by Marcel Camargos on 05/02/23.
//

import XCTest
@testable import Weather

final class WeatherViewControllerTests: XCTestCase {
    
    // MARK: - System under test
    
    var sut: WeatherViewController?

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        sut = WeatherViewController()
        sut?.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Test Mock
    
    class WeatherInteractorSpy: WeatherInteractorDelegate {
        
        // MARK: Method call expectations
        
        var getWeatherCalled = false
        
        // MARK: Spied methods
        
        func fetchWeather() {
            getWeatherCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testShouldGetWeatherWhenViewDidAppear() {
        // Given
        let weatherInteractorSpy = WeatherInteractorSpy()
        sut?.interactor = weatherInteractorSpy
        
        // When
        sut?.viewDidAppear(true)
        
        // Then
        XCTAssert(weatherInteractorSpy.getWeatherCalled, "Should fetch weather detail right after the viewDidAppear")
    }
    
    func testShouldDisplayFetchedEvent() {
        // Given
        let weatherInteractorSpy = WeatherInteractorSpy()
        sut?.interactor = weatherInteractorSpy
        
        // When
        let weather = Seeds.Weat.weather
        let viewModel = WeatherModel.ViewModel(weather: weather, icon: UIImage())
        
        sut?.presenter(didSuccessShowWeather: viewModel)
        
        // Then
        XCTAssertEqual(sut?.contentView?.cityTitleLabel.text, "Toronto", "Displayed city should be Toronto")
        XCTAssertEqual(sut?.contentView?.postTitleContentLabel.text, "\(Int(21.95))°", "Displayed temperature should be 21°")
        XCTAssertEqual(sut?.contentView?.descriptionLabel.text, "Light Cloud", "Displayed description should be Light Cloud")
        XCTAssertEqual(sut?.contentView?.valueLowTemperatureLabel.text, "\(Int(15.685))°", "Displayed low temperature should be 15°")
        XCTAssertEqual(sut?.contentView?.valueHighTemperatureLabel.text, "\(Int(21.355))°", "Displayed high temperature should be 21°")
    }
}
