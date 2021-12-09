//
//  MovieManager.swift
//  TDD_SB
//
//  Created by Hoshiar Sher on 12/7/21.
//

import Foundation
import CoreText


class MovieManager{
    
    var moviesToSeeCount:Int {
        moviesToSeeArray.count
    }
    var movieSeenCount:Int {
        moviesSeenArray.count
    }
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie(movie: Movie){
        if !moviesToSeeArray.contains(movie){
        moviesToSeeArray.append(movie)
        }
    }
    
    func movieAtIndex(index: Int) -> Movie{
        return moviesToSeeArray[index]
    }
    
    
    func checkOffMovieAtIndeex(index: Int){
        guard index < moviesToSeeCount else {return}

        let checkeedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkeedMovie)
    }
    
    func checkedOffMovieAtIndeex(index: Int) -> Movie{
        return moviesSeenArray[index]
    }
    
    func clearArrays(){
        moviesSeenArray.removeAll()
        moviesToSeeArray.removeAll()
    }
    
}
