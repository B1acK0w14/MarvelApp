//
//  Comics.swift
//  MarvelApp
//
//  Created by David Penagos on 28/03/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Comics: Codable {
    let status, copyright, attributionText: String?
    let attributionHTML: String?
    let data: Data?
    let etag: String?
    let code: Int?
}
//
// MARK: - Data
struct Data: Codable {
    let offset, limit, total, count: Int?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let id, digitalID, pageCount: Int?
    let title: String?
    let issueNumber: Int?
    let variantDescription, resultDescription, isbn: String?
    let modified: String?
    let upc, diamondCode, ean, issn: String?
    let format: String?
    let textObjects: [TextObject]?
    let resourceURI: String?
    let urls: [URLElement]?
    let series: Series?
    let variants, collections, collectedIssues: [Series]?
    let dates: [DateElement]?
    let prices: [Price]?
    let thumbnail: Thumbnail?
    let images: [Thumbnail]?
    let creators, characters: Characters?
    let stories: Stories?
    let events: Events?

    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title, issueNumber, variantDescription
        case resultDescription = "description"
        case modified, isbn, upc, diamondCode, ean, issn, format, pageCount, textObjects, resourceURI, urls, series, variants, collections, collectedIssues, dates, prices, thumbnail, images, creators, characters, stories, events
    }
}

// MARK: - Characters
struct Characters: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [CharactersItem]?
}

// MARK: - CharactersItem
struct CharactersItem: Codable {
    let resourceURI, name, role: String?
}

// MARK: - Series
struct Series: Codable {
    let resourceURI, name: String?
}

// MARK: - DateElement
struct DateElement: Codable {
    let type: String?
    let date: String?
}

// MARK: - Events
struct Events: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [Series]?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path, thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - Price
struct Price: Codable {
    let type: String?
    let price: Float?
}

// MARK: - Stories
struct Stories: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI, name, type: String?
}

// MARK: - TextObject
struct TextObject: Codable {
    let type, language, text: String?
}

// MARK: - URLElement
struct URLElement: Codable {
    let type, url: String?
}
