//
//  MovieManager.swift
//  TDD_SB
//
//  Created by Hoshiar Sher on 12/7/21.
//

import Foundation


class MovieManager{
    var moviesToSee = 0
    var movieSeenCount = 0
    private var moviesToSeeArray = [Movie]()
    func addMovie(movie: Movie){
        moviesToSee += 1
    }
    
    func movieAtIndex(index: Int) -> Movie{
        return Movie(title: "Test Movie")
    }
}
