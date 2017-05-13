//
//  PokeCell.swift
//  poke
//
//  Created by Hung Nguyen on 5/12/17.
//  Copyright © 2017 Luvdub Nation. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
 
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    func configureCell(pokemon: Pokemon) {
        
        img.image = UIImage(named: pokemon.pokedexID)
        
        name.text = pokemon.name
    }
 
    
    
}
