//
//  MovieCellTest.swift
//  TDD_SBTests
//
//  Created by Hoshiar Sher on 12/9/21.
//

import XCTest
@testable import TDD_SB

class MovieCellTest: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    override func setUp() {
        super.setUp()
        let libraryVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerId") as! LibraryViewController
        _ = libraryVC.view
        
        tableView = libraryVC.libraryTableView
        
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
        
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShouldSetLabel(){
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: IndexPath(row: 0, section: 0)) as! MovieCellTableViewCell
        //tableView.dequeueReusableCell(withIdentifier: "movieCellId") as! MovieCellTableViewCell
        
        //cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellTableViewCell
        cell.configMovieCell(movie: Movie(title: "Action", releaseDate: "2018"))
        XCTAssertEqual(cell.textLabel?.text, "Action")
//        XCTAssertEqual(cell.detailTextLabel?.text,  "2018")
        
    }
    
    
    

}
