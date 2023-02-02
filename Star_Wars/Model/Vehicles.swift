//
//  Vehicles.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import Foundation

struct Vehicle : Decodable {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let max_atmosphering_speed: String
    let crew: String
    let passengers: String
    let cargo_capacity: String
    let consumables: String
    let vehicle_class: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

struct InfoVehicles : Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Vehicle]
}