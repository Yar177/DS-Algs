//
//  DataRequest.swift
//  MultiPlatformApp
//
//  Created by Hoshiar Sher on 12/12/21.
//

import Foundation
import CoreLocation

enum GetDataRequest<Type>{
    case success([Type])
    case failure
}

struct DataRequest<Type> where Type: Decodable{
    let basePath = "https://explorecalifornia.org/api/weather/city/"
    let dataURL:URL
    
    init(city: String){
        let dataPathString = (basePath + city).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        guard let dataUrl = URL(string: dataPathString) else { fatalError()}
        self.dataURL = dataUrl
    }
    
    func getData(completion: @escaping (GetDataRequest<Type>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: dataURL) { data, response, error in
            guard let jsonData = data else {
                completion(.failure)
                return
            }
            do {
                let resources = try JSONDecoder().decode([Type].self, from: jsonData)
                completion(.success(resources))
            }catch{
                completion(.failure)
            }
        }
        dataTask.resume()
    }
}
