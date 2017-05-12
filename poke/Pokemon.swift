//
//  Pokemon.swift
//  poke
//
//  Created by Hung Nguyen on 5/12/17.
//  Copyright © 2017 Luvdub Nation. All rights reserved.
//

import Foundation

class Pokemon {
    
    fileprivate var _name: String!
    
    fileprivate var _pokedexID: String!
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var pokedexID: String {
        if _pokedexID == nil {
            _pokedexID = ""
        }
        return _pokedexID
    }
    
    init (name: String, ID: String) {
        
        _name = name
        
        _pokedexID = ID
    }
    
}
