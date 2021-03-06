//
//  MovieStructTests.swift
//  TDD_SBTests
//
//  Created by Hoshiar Sher on 12/7/21.
//

import XCTest
@testable import TDD_SB

class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testIinit_MovieWithTitle(){
        let titile = "Generic Blockbuster"
        let testMovie = Movie(title: titile)
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, titile)
    }
    
    
    func testInit_SetMovieTitleAndReelease(){
        let title = "Romantic Comedy"
        let releaseDate = "1987"
        let testMovie = Movie(title: title, releaseDate: releaseDate)
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, title)
        XCTAssertEqual(testMovie
                        .releaseDate, releaseDate)        
    }
    
    
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testEquatable_ReturnTrue(){
        let title = "Action"
        let action1 = Movie(title: title)
        let action2 = Movie(title: title)
        
        XCTAssertEqual(action1, action2)
    }
    
    func testEquatable_ReturnsNotEqatableForDifferentMovies(){
        let title = "Action"
        let action1 = Movie(title: title)
        let action2 = Movie(title: "\(title)1")
        XCTAssertNotEqual(action1, action2)
    }


}
