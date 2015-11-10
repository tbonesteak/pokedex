//
//  ViewController.swift
//  pokedex
//
//  Created by Jon on 11/6/15.
//  Copyright © 2015 Jon. All rights reserved.
//

import UIKit

// we want to get a whole bunch of cells onto our screen, and here's where we do it! we want to set it up to work with collection views.

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    
    var pokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.delegate = self
        collection.dataSource = self
        
        parsePokemonCSV()
    }
    
    func parsePokemonCSV() {
        
        //Grabbing the path of the CSV file.
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do {
            
            //Parsing the CSV file.
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            //Iterating through the rows. Each row is a dictionary and we're grabbing the name and ID and throwing it into our array
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke) // adding to the array we created on line 17
                
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    //The role of cellForItemAtIndexPath is to return cells on the screen.
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //We are telling it to give us a reusable cell.
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Pokecell", forIndexPath: indexPath) as? PokeCell {
            
            let poke = pokemon[indexPath.row]
    
            cell.configureCell(poke)
            return cell
            
        } else {
            // Returns a new cell if the above failed.
            return UICollectionViewCell()
        }
      
    }
    
    //Everytime we select a cell, we want to do something with it.
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //We need to know how many items are in each section.
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    //We want to set the size of the grid so it looks nice.
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //setting the height and width. 105 by 105 is a good size.
        return CGSizeMake(105, 105)
    }
}

