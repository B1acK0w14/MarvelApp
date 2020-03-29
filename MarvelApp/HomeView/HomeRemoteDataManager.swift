//
//  HomeRemoteDataManager.swift
//  MarvelApp
//
//  Created by David Penagos on 28/03/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {

    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    let endPoint: EndPoint = EndPoint()
    var comicsModel: Comics = Comics(status: nil, copyright: nil, attributionText: nil, attributionHTML: nil, data: nil, etag: nil, code: nil)
    
    func remoteGetComics() {
        //ANNOTATION - On "?" you can put "limit=10&" for show only 10 items, or change that number for more.
        let url = endPoint.urlBase + endPoint.comicsEndPoint + "?" +  endPoint.apiKey + endPoint.hashValue
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil, let result = response as? HTTPURLResponse else {
              print("Conection error: \(String(describing: error))")
              return
            }
            
            if(result.statusCode == 200) {
                do {
                    self.comicsModel = try JSONDecoder().decode(Comics.self, from: data)
                    self.remoteRequestHandler?.remoteCallBackData(with: self.comicsModel)
                } catch {
                    print("Parse error: \(error)")
                }
            } else {
              print("General error: \(String(describing: error))")
            }
        }.resume()
    }
}
