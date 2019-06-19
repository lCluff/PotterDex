//
//  CharacterDetailViewController.swift
//  PotterDex
//
//  Created by Leah Cluff on 6/13/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController, UINavigationControllerDelegate {
    
//    var characters: [Character] = []
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var patronusLabel: UILabel!
    @IBOutlet weak var bloodStatusLabel: UILabel!
    @IBOutlet weak var wandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.updateViews()
    }
    var character: Character? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    func updateViews() {
        guard let characters = character else {return}
        bloodStatusLabel.text = characters.bloodStatus
        houseLabel.text = characters.house
        patronusLabel.text = characters.patronus
        wandLabel.text = characters.wand
        nameLabel.text = characters.name
        speciesLabel.text = characters.species
        
    }
//    @IBAction func swipeToReturn(_ sender: UIGestureRecognizer) {
//        guard UIGestureRecognizer == interactivePopGestureRecognizer else {
//            return true // default value
//        }
//        
//        return viewControllers.count > 1 && duringPushAnimation == false
//    }
}



