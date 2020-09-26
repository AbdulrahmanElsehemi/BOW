//
//  FetchImageModel.swift
//  BOW
//
//  Created by Abdelrahman on 9/24/20.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class Photos {
    var id : Int!
    var width : Int!
    var height : Int!
    var thumbnail : String!
    
}
class FetchImageModel:NSObject {
    var totalResults : Int!
    var photoData :[Photos]!
    
    static func fetchImages(url:String,query:String,perPage:String, page:String,completionHandler: @escaping (FetchImageModel)->()) {
        let url = "\(url)/?query=\(query)&per_page=\(perPage)&page=\(page)"
        let headers:HTTPHeaders = [
            "Authorization": "\(Constants.API_KEY)"
        ]
        
        Alamofire.request(url,method: .get,encoding: URLEncoding.httpBody,headers: headers).responseJSON { response in
            switch(response.result){
            
            case .success(_):
                let data = JSON(response.value!)
                let modelData = FetchImageModel()
                modelData.totalResults = data["total_results"].int
                var photosData = [Photos]()
                for i in 0..<data["photos"].count {
                    let photo = Photos()
                    photo.id = data["photos"][i]["id"].int
                    photo.height = data["photos"][i]["height"].int
                    photo.width = data["photos"][i]["width"].int
                    photo.thumbnail = data["photos"][i]["src"]["medium"].string
                    photosData.append(photo)
                    
                }
                modelData.photoData = photosData
                DispatchQueue.main.async {
                    completionHandler(modelData)
                }
                
                break
            case .failure(_):
                print(response.error!)
                break
            }
        }
        
    }
    
}

