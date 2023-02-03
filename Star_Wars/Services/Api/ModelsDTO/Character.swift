//
//  Character.swift
//  Star_Wars
//
//  Created by Елена on 02.02.2023.
//

import Foundation

struct Character: Decodable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
}

struct InfoCharacters: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Character]
}
