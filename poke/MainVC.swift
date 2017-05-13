//
//  MainVC.swift
//  poke
//
//  Created by Hung Nguyen on 5/12/17.
//  Copyright © 2017 Luvdub Nation. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var musicPlayer = AVAudioPlayer()
    var pokemon = [Pokemon]()
    var musicPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadSong()
        parseCSV()
        
    }
    
    func loadSong() {
        
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: ".mp3")!)
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: path)
            musicPlayer.prepareToPlay()
        } catch let error as NSError {
            print(error)
        }
        
    }

    func parseCSV() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        
        do {
            let csv = try CSV(contentsOfURL: path!)
            for row in csv.rows {
                var name = ""
                var ID = ""
                var pokeHeight = ""
                var pokeWeight = ""
                
                if let identifier = row["identifier"] {
                    name = identifier
                }
                
                if let number = row["id"] {
                    ID = number
                }
                
                if let height = row["height"] {
                    pokeHeight = height
                }
                
                if let weight = row["weight"] {
                    pokeWeight = weight
                }
                
                let poke = Pokemon(name: name, ID: ID, height: pokeHeight, weight: pokeWeight)
                pokemon.append(poke)
                
            }
            
        } catch let error as NSError {
            print(error)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.cellForItem(at: indexPath) != nil {
            let poke = pokemon[indexPath.row]
            performSegue(withIdentifier: "PokeDetailsVC", sender: poke)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokeDetailsVC" {
            if let package = sender as? Pokemon {
                if let destination = segue.destination as? PokemonDetailsVC {
                    destination.pokemon = package
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            cell.configureCell(pokemon: pokemon[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        if musicPlaying {
            musicPlaying = false
            musicPlayer.pause()
        } else {
            musicPlaying = true
            musicPlayer.play()
        }
    }

}

