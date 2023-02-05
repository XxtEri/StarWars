//
//  Character.swift
//  Star_Wars
//
//  Created by Елена on 02.02.2023.
//

import Foundation

struct Character: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair_color = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case films
        case species
        case vehicles
        case starships
        case created
        case edited
        case url
    }
    
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.height = try container.decode(String.self, forKey: .height)
        self.mass = try container.decode(String.self, forKey: .mass)
        self.hairColor = try container.decode(String.self, forKey: .hair_color)
        self.skinColor = try container.decode(String.self, forKey: .skinColor)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.birthYear = try container.decode(String.self, forKey: .birthYear)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.homeworld = try container.decode(String.self, forKey: .homeworld)
        self.films = try container.decode([String].self, forKey: .films)
        self.species = try container.decode([String].self, forKey: .species)
        self.vehicles = try container.decode([String].self, forKey: .vehicles)
        self.starships = try container.decode([String].self, forKey: .starships)
        self.created = try container.decode(String.self, forKey: .created)
        self.edited = try container.decode(String.self, forKey: .edited)
        self.url = try container.decode(String.self, forKey: .url)
    }
}

struct InfoCharacters: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Character]
}
