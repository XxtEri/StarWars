//
//  Planet.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import Foundation

struct PlanetModel: Decodable {
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

struct InfoPlanets: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PlanetModel]
}
