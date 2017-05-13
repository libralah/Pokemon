//
//  PokemonDetailsVC.swift
//  poke
//
//  Created by Hung Nguyen on 5/12/17.
//  Copyright © 2017 Luvdub Nation. All rights reserved.
//

import UIKit

class PokemonDetailsVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var nextEvoLvlLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var pokeDexIdLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var mainPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        pokeDexIdLbl.text = pokemon.pokedexID
        mainPic.image = UIImage(named: pokemon.pokedexID)
        currentEvoImg.image = UIImage(named: pokemon.pokedexID)
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        
    }


    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
