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
    
    fileprivate var _height: String!
    
    fileprivate var _weight: String!
    
    var weight: String {
       if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name.capitalized
    }
    
    var pokedexID: String {
        if _pokedexID == nil {
            _pokedexID = ""
        }
        return _pokedexID
    }
    
    init (name: String, ID: String, height: String, weight: String) {
        
        _name = name
        
        _pokedexID = ID
        
        _height = height
        
        _weight = weight
    }
    
}
