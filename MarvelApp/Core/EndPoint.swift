//
//  EndPoint.swift
//  MarvelApp
//
//  Created by David Penagos on 28/03/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import Foundation
class EndPoint {
    //ANNOTATION - Base for all request
    let urlBase = "https://gateway.marvel.com/v1/public/"
    let apiKey = "ts=1&apikey=b5dd158dd0e856443db7fb726fbc6bc9"
    let hashValue = "&hash=80182fcb24c6426319114b9e34eafed6"
    
    //ANNOTATION - Diferents options for request
    let comicsEndPoint = "comics"
}
