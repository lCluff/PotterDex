//
//  Character.swift
//  PotterDex
//
//  Created by Leah Cluff on 6/13/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

class Character: Codable {
    let name: String
    let house: String?
    let bloodStatus: String?
    let species: String?
    let patronus: String?
    let wand: String?
    
    init(name: String, house: String, bloodStatus: String, species: String, patronus: String, wand: String) {
        self.name = name
        self.house = house
        self.bloodStatus = bloodStatus
        self.species = species
        self.patronus = patronus
        self.wand = wand
    }
    
}

