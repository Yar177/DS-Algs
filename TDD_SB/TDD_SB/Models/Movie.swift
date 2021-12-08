//
//  Movie.swift
//  TDD_SB
//
//  Created by Hoshiar Sher on 12/7/21.
//

import Foundation


struct Movie: Equatable {
    let title:String
    let releaseDate:String?
    
    init(title: String, releaseDate:String? = nil){
        self.title = title
        self.releaseDate = releaseDate
    }
}
