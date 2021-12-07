//
//  MovieManagerTests.swift
//  TDD_SBTests
//
//  Created by Hoshiar Sher on 12/7/21.
//

import XCTest
@testable import TDD_SB

class MovieManagerTests: XCTestCase {
    
    var sut:MovieManager!
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let artHouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie =  Movie(title: "Action")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUp() {
        super.setUp()
        sut = MovieManager()
    }
 //MARK: INIT MOVIEMANAGER
    func testInit_MoviesToSee_ReturnZero(){
        let moviesToSee = 0
        XCTAssertEqual(sut.moviesToSee, moviesToSee)
    }
    
    func testInit_MoviesScene_ReturnsZero(){
        let movieSeenCount = 0
        XCTAssertEqual(sut.movieSeenCount, movieSeenCount)
    }

//    MARK: Add & Query
    func tetsAdd_MoviesToSee_ReturnOne(){
        let title = "Sci-Fi"
        let testMovie = Movie(title: title)
        sut.addMovie(movie: testMovie)
        XCTAssertEqual(sut.moviesToSee, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex(){
        let title = "Drama"
        let testMovie = Movie(title: title)
        sut.addMovie(movie: testMovie)
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(testMovie.title, movieQueried.title)
    }
    
//    MARK: Check Off
    func testCheckOffMovie_UpdatesMovieManagerCount(){
        let title = "Action"
        sut.addMovie(movie: Movie(title: title))
        sut.checkOffMovieAtIndeex(index: 0)
        XCTAssertEqual(sut.moviesToSee, 0)
        XCTAssertEqual(sut.movieSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: artHouseMovie)
        sut.checkOffMovieAtIndeex(index: 0)
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, actionMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex(){
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndeex(index: 0)
        let movieQueried = sut.checkedOffMovieAtIndeex(index: 0)
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    
    
}
