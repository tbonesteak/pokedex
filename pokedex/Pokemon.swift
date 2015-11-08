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
    private var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        _pokedexId = pokedexId
        _name = name
    }
}