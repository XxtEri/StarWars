//
//  File.swift
//  Star_Wars
//
//  Created by Елена on 02.02.2023.
//

import Foundation

enum TitleScreen: String, CaseIterable {
    case characters = "Characters"
    case films = "Films"
    case starships = "Starships"
    case vehicles = "Vehicles"
    case planets = "Planets"
    case species = "Species"
    case non = "Non"
}

enum CardType {
    case characters([Character])
    case films([Film])
    case planets([Planet])
    case species([Specie])
    case starships([Starship])
    case vehicles([Vehicle])
    case non
}
