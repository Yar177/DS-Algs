//
//  MocksExtensions.swift
//  TDD_SBTests
//
//  Created by Hoshiar Sher on 12/9/21.
//

import Foundation
import UIKit

@testable import TDD_SB

extension MovieLibraryDataServiceTest{
    class TableViewMock: UITableView{
        var cellDequed = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequed = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    
    class MovieCellMock: MovieCellTableViewCell{
        var movieData: Movie?
        
        override  func configMovieCell(movie: Movie){
            movieData = movie
        }
    }
   
}



extension MovieCellTest{
    class MockCellDataSource: NSObject,  UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
