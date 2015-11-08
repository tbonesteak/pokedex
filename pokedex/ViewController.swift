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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.delegate = self
        collection.dataSource = self
    }
    
    //The role of cellForItemAtIndexPath is to return cells on the screen.
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //We are telling it to give us a reusable cell.
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Pokecell", forIndexPath: indexPath) as? PokeCell {
            
            let pokemon = Pokemon(name: "test", pokedexId: indexPath.row)
            cell.configureCell(pokemon)
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

