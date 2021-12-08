//
//  LibraryViewControllerTest.swift
//  TDD_SBTests
//
//  Created by Hoshiar Sher on 12/7/21.
//

import XCTest
@testable import TDD_SB


class LibraryViewControllerTest: XCTestCase {
    
    var sut: LibraryViewController!
    
    override func setUp() {
        super.setUp()
        sut = LibraryViewController()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: Nil Checks
    func testLibraryVC_TVNotNil(){
        
    }

}
