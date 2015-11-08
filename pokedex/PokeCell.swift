//
//  PokeCell.swift
//  pokedex
//
//  Created by Jon on 11/7/15.
//  Copyright © 2015 Jon. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {

    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    // This is the variable we are using to store the Pokemon instance everytime we create it from the Pokemon class. We use this every time we create a new cell.
    
    var pokemon: Pokemon!
    
    //  This gives our cells a rounded corner.
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon //passing in the parameter data into the pokemon container we created on line 17
        
        //pulling the name property out of the object and capitalizing it, and sticking it into out nameLbl.
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
