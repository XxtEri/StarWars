//
//  Species.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import Foundation

struct Specie: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld
        case language
        case people
        case films
        case created
        case edited
        case url
    }
    
    let name: String
    let classification: String
    let designation: String
    let averageHeight: String
    let skinColors: String
    let hairColors: String
    let eyeColors: String
    let averageLifespan: String
    let homeworld: String?
    let language: String
    let people: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.classification = try container.decode(String.self, forKey: .classification)
        self.designation = try container.decode(String.self, forKey: .designation)
        self.averageHeight = try container.decode(String.self, forKey: .averageHeight)
        self.skinColors = try container.decode(String.self, forKey: .skinColors)
        self.hairColors = try container.decode(String.self, forKey: .hairColors)
        self.eyeColors = try container.decode(String.self, forKey: .eyeColors)
        self.averageLifespan = try container.decode(String.self, forKey: .averageLifespan)
        self.homeworld = try container.decode(String.self, forKey: .homeworld)
        self.language = try container.decode(String.self, forKey: .language)
        self.people = try container.decode([String].self, forKey: .people)
        self.films = try container.decode([String].self, forKey: .films)
        self.created = try container.decode(String.self, forKey: .created)
        self.edited = try container.decode(String.self, forKey: .created)
        self.url = try container.decode(String.self, forKey: .edited)
    }
}

struct InfoSpecies: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Specie]
}
