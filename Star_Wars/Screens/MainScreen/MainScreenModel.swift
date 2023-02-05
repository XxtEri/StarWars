//
//  MainScreenModel.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

struct MainScreenModel {
    let title: Category
    let imageName: String
}

enum Category: String, CaseIterable {
    case characters = "Characters"
    case films = "Films"
    case starships = "Starships"
    case vehicles = "Vehicles"
    case planets = "Planets"
    case species = "Species"
}

