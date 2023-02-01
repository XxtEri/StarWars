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
    let homeworld: Link
    let language: String
    let people: [Link]
    let films: [Link]
    let created: String
    let edited: String
    let url: Link
}

struct InfoSpecies: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Specie]
}
