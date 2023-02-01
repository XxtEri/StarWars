//
//  Species.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import Foundation

struct Specie: Decodable {
    let name: String
    let classification: String
    let designation: String
    let average_height: String
    let skin_colors: String
    let hair_colors: String
    let eye_colors: String
    let average_lifespan: String
    let homeworld: String
    let language: String
    let people: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

struct InfoSpecies: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Specie]
}
