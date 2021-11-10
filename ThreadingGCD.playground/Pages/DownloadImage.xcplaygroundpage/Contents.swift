//: [Previous](@previous)

import Foundation
import UIKit

let stringUrl = "https://www.solarsystemscope.com/textures/download/2k_earth_daymap.jpg"
let url = URL(string: "https://www.solarsystemscope.com/textures/download/2k_earth_daymap.jpg")
DispatchQueue.global().async {
    guard let data = try? Data(contentsOf: url!) else{return}
    DispatchQueue.main.async {
        let image = UIImage(data: data)
    }
}

let serialQueue = DispatchQueue(label: "serial")
let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)

serialQueue.async {
 }

concurrentQueue.async {
}

//DispatchQueue.main
//DispatchQueue.global()
//DispatchQueue

//DispatchQueue.main.async {
//    let vc = UINavigationController()
//    UINavigationController.pushViewController(vc, animated: true)
//}

DispatchQueue.global(qos: .userInteractive).async {
    guard let data = try? Data(contentsOf: url!) else{return}
    DispatchQueue.main.async {
        let image = UIImage(data: data)
    }
}

//MARK: Custome queues
let inactiveQueue = DispatchQueue(label: "concurrent", attributes: [.initiallyInactive, .concurrent])
inactiveQueue.async {
    print("inactiveQueue running")
}
inactiveQueue.activate()

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView{
    func loadImageCachedImg(_ url: String){
        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: url)){
            self.image = cachedImage
            return
        }
        
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url, completionHandler: {(data, response, errror) in
                if errror != nil{
                    print("\(String(describing:errror))")
                    return
                }
                
                DispatchQueue.main.async {
                    if let data = data{
                        if let downloadedImage = UIImage(data: data){
                            // imageCache.setObject(downloadedImage, forKey: NSString(string: url))
                            imageCache.setObject(downloadedImage, forKey: NSString(string: "url"))
                            self.image = downloadedImage
                            
                        }
                    }
                }
                
            }).resume()
        }
    }
}

let imgaview = UIImageView()
imgaview.loadImageCachedImg(stringUrl)















/*
 let imageCache = NSCache<NSString, UIImage>()
 extension UIImageView {
     func loadImageUsingCacheWithURLString(_ URLString: String) {
         self.image = nil
         if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
             self.image = cachedImage
             return
         }
         if let url = URL(string: URLString) {
             URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                 if error != nil {
                     print("\(error)")
                     return
                 }
                DispatchQueue.main.async {
                     if let data = data {
                         if let downloadedImage = UIImage(data: data) {
                             imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                             self.image = downloadedImage
                         }
                     }
                 }
             }).resume()
         }
     }
 }

 */

//: [Next](@next)
