//
//  Pokemon.swift
//  pokedex
//
//  Created by Jon on 11/6/15.
//  Copyright © 2015 Jon. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: String!
    
    var game: String {
        return _name
    }
    
    var pokedexId: String {
        return _pokedexId
    }
    
    init(same: String, pokedexId: String) {
        _pokedexId = pokedexId
        _name = same
    }
}