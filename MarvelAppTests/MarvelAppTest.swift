//
//  MarvelAppTest.swift
//  MarvelAppTests
//
//  Created by David Andres Penagos Sanchez on 27/05/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import XCTest
@testable import MarvelApp

class MarvelAppTest: XCTestCase {
    
    let endPoint: EndPoint = EndPoint()
    
    override class func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCallAPIGetComicsSuccess() throws {
        //given
        let comicsURL = URL(string: endPoint.urlBase + endPoint.comicsEndPoint + "?" +  endPoint.apiKey + endPoint.hashValue)!
        var request = URLRequest(url: comicsURL)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        let promise = expectation(description: "Call API success")
        
        //when
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let _ = data, error == nil, let result = response as? HTTPURLResponse else {
              print("Conection error: \(String(describing: error))")
              return
            }
            //then
            do {
                XCTAssertTrue(result.statusCode == 200)
                promise.fulfill()
            }
        }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCallAPIGetComicsFailure() throws {
        //given
        let comicsURL = URL(string: endPoint.urlBase + endPoint.comicsEndPoint + "?" +  endPoint.apiKey)!
        var request = URLRequest(url: comicsURL)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        let promise = expectation(description: "Call API failure")
        
        //when
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let _ = data, error == nil, let result = response as? HTTPURLResponse else {
              print("Conection error: \(String(describing: error))")
              return
            }
            //then
            do {
                XCTAssertTrue(result.statusCode != 200)
                promise.fulfill()
            }
        }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCallAPIGetComicsReturnComicsSuccess() throws {
        //given
        let comicsURL = URL(string: endPoint.urlBase + endPoint.comicsEndPoint + "?" +  endPoint.apiKey + endPoint.hashValue)!
        var request = URLRequest(url: comicsURL)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        let promise = expectation(description: "Call API failure")
        
        //when
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil, let _ = response as? HTTPURLResponse else {
              print("Conection error: \(String(describing: error))")
              return
            }
            //then
            do {
                let comicModel = try JSONDecoder().decode(Comics.self, from: data)
                XCTAssertNotNil(comicModel)
                promise.fulfill()
            } catch let error {
                print("Error: ", error)
            }
        }.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }

}
