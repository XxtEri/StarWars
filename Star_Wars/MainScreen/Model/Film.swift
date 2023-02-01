//
//  Film.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import Foundation

struct Film: Decodable {
    let title: String
    let episode_id: Int
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String
}

struct InfoFilms: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Film]
}
