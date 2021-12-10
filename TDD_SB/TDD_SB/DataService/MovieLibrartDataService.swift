//
//  MovieLibrartDataService.swift
//  TDD_SB
//
//  Created by Hoshiar Sher on 12/7/21.
//

import UIKit


enum LibrarySection:Int{
    case moviesToSee, moviesSeen
}

class MovieLibrartDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else {
            return 0
        }
        guard let librarySection = LibrarySection(rawValue: section) else {fatalError() }
        switch librarySection {
        case .moviesToSee:
            return movieManager.moviesToSeeCount
        case .moviesSeen:
            return movieManager.movieSeenCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieManager = movieManager else {
            fatalError()
        }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else {fatalError()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: indexPath) as! MovieCellTableViewCell
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.checkedOffMovieAtIndeex(index: indexPath.row)
        cell.configMovieCell(movie: movieData)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else {fatalError()}
        guard let librarYySection = LibrarySection(rawValue: indexPath.section) else {fatalError()}
        if librarYySection == .moviesToSee {
            movieManager.checkedOffMovieAtIndeex(index: indexPath.row)
            tableView.reloadData()
        }
        
    }
}
