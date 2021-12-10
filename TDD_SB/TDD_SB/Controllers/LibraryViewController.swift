//
//  ViewController.swift
//  TDD_SB
//
//  Created by Hoshiar Sher on 12/7/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    var movieManager = MovieManager()
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibrartDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.register(MovieCellTableViewCell.self, forCellReuseIdentifier: "movieCellId")

        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        
        let scifiMovie = Movie(title: "Sci-Fi1", releaseDate: "2020")
        let artHouseMovie = Movie(title: "Arthouse Drama1", releaseDate: "2200")
        let actionMovie =  Movie(title: "Action1")
        let scifiMovie1 = Movie(title: "Sci-Fi")
        let artHouseMovie1 = Movie(title: "Arthouse Drama", releaseDate: "2019")
        let actionMovie1 =  Movie(title: "Action")
        dataService.movieManager?.addMovie(movie: scifiMovie)
        dataService.movieManager?.addMovie(movie: scifiMovie1)
        dataService.movieManager?.addMovie(movie: artHouseMovie)
        dataService.movieManager?.addMovie(movie: artHouseMovie1)
        dataService.movieManager?.addMovie(movie: actionMovie)
        dataService.movieManager?.addMovie(movie: actionMovie1)

        libraryTableView.reloadData()
    }
    
    
    


}

