//
//  IconWorkerTests.swift
//  WeatherTests
//
//  Created by Marcel Camargos on 05/02/23.
//

@testable import Weather
import XCTest

class IconWorkerTests: XCTestCase {
    
    // MARK: - System under test
    
    var sut: IconWorkerDelegate?
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        let iconNetworkServiceDatasource: IconNetworkServiceDatasource = IconNetworkService()
        sut = IconWorker(iconNetworkServiceDatasource)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test Mock
    
    class IconNetworkServiceSuccessSpy: IconNetworkServiceDatasource {
        
        // MARK: Method call expectations
        
        var getIconCalled = false
        
        // MARK: Argument expectations

        var icon: UIImage = UIImage()
        
        // MARK: Spied methods
        func getIcon(weather_state_abbr: String, success: @escaping (UIImage) -> (), fail: @escaping (String) -> ()) {
            getIconCalled = true
            success(icon)
        }
    }
    
    class IconNetworkServiceErrorFailSpy: IconNetworkServiceDatasource {
        
        // MARK: Method call expectations
        
        var getIconCalled = false
        
        // MARK: Argument expectations

        var icon: UIImage = UIImage()
        
        // MARK: Spied methods
        func getIcon(weather_state_abbr: String, success: @escaping (UIImage) -> (), fail: @escaping (String) -> ()) {
            getIconCalled = true
            fail("Error with fetching icon")
        }
    }
    
    class IconNetworkServiceCodeFailSpy: IconNetworkServiceDatasource {
        
        // MARK: Method call expectations
        
        var getIconCalled = false
        
        // MARK: Argument expectations

        var icon: UIImage = UIImage()
        
        // MARK: Spied methods
        func getIcon(weather_state_abbr: String, success: @escaping (UIImage) -> (), fail: @escaping (String) -> ()) {
            getIconCalled = true
            fail("Error with the response, unexpected status code")
        }
    }
    
    // MARK: - Tests
    
    func testsIconWorkerShouldReturnIcon() {
        // Given
        let serviceSpy = IconNetworkServiceSuccessSpy()
        sut = IconWorker(serviceSpy)
        
        // When
        var loggedIcon: UIImage?
        let expect = expectation(description: "Wait for icon to return")
        
        sut?.getIcon(weather_state_abbr: "lc", success: { (icon) in
            loggedIcon = icon
            expect.fulfill()
        }, fail: { (response) in
            
        })
        waitForExpectations(timeout: 1.1)
        
        //Then
        XCTAssertNotNil(loggedIcon, "logged icon should be different from nil")
    }
    
    func testIconWorkerErrorFail() {
        // Given
        let serviceSpy = IconNetworkServiceErrorFailSpy()
        serviceSpy.icon = UIImage()

        sut = IconWorker(serviceSpy)

        // When
        var iconError: String?
        let expect = expectation(description: "Wait for icon to return")

        sut?.getIcon(weather_state_abbr: "lc", success: { (icon) in

        }, fail: { (message) in
            iconError = message
            expect.fulfill()
        })
        waitForExpectations(timeout: 1.1)

        //Then
        XCTAssertEqual(iconError, "Error with fetching icon", "error message should be 'Error with fetching icon'")
    }

    func testIconWorkerCodeFail() {
        // Given
        let serviceSpy = IconNetworkServiceCodeFailSpy()
        serviceSpy.icon = UIImage()

        sut = IconWorker(serviceSpy)

        // When
        var iconCodeError: String?
        let expect = expectation(description: "Wait for icon to return")

        sut?.getIcon(weather_state_abbr: "lc", success: { (icon) in

        }, fail: { (message) in
            iconCodeError = message
            expect.fulfill()
        })
        waitForExpectations(timeout: 1.1)

        //Then
        XCTAssertEqual(iconCodeError, "Error with the response, unexpected status code", "error message should be 'Error with the response, unexpected status code'")
    }
}
