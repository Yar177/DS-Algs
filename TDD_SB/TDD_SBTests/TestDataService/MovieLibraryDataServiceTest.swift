//
//  MovieLibraryDataServiceTest.swift
//  TDD_SBTests
//
//  Created by Hoshiar Sher on 12/7/21.
//

import XCTest
@testable import TDD_SB

class MovieLibraryDataServiceTest: XCTestCase {
    
    var sut: MovieLibrartDataService!
    var tableView: UITableView!
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let artHouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie =  Movie(title: "Action")
    
    
    override func setUp() {
        super.setUp()
        sut = MovieLibrartDataService()
        sut.movieManager = MovieManager()
        tableView = UITableView()
        tableView.dataSource = sut
        tableView.delegate = sut
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  //MARK: Sections
    func testTVSectionsCount(){
//        let dataService = MovieLibrartDataService()
//        let tableView = UITableView()
//        tableView.dataSource = dataService
        
        let sections = tableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableView_SectionOne(){
        sut.movieManager?.addMovie(movie: scifiMovie)
        sut.movieManager?.addMovie(movie: actionMovie)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: artHouseMovie)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableVIewSectionTwo(){
        sut.movieManager?.addMovie(movie: scifiMovie)
        sut.movieManager?.addMovie(movie: actionMovie)
        sut.movieManager?.checkOffMovieAtIndeex(index: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        sut.movieManager?.checkOffMovieAtIndeex(index: 0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    
//    MARK: Cells
    func testCell_RoxAtIndex(){
        sut.movieManager?.addMovie(movie: actionMovie)
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is MovieCell)
    }

}
