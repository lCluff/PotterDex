//
//  CharacterListTableViewController.swift
//  PotterDex
//
//  Created by Leah Cluff on 6/13/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class CharacterListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CharacterController.sharedInstance.fetchCharacters(searchTerm: "") { (characters) in
            DispatchQueue.main.async {
                self.tableView.reloadData()                
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CharacterController.sharedInstance.characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        let thisCellsCharacter = CharacterController.sharedInstance.characters[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = thisCellsCharacter.name
        return cell
    }
    
    //  MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterVController", let indexPath = tableView.indexPathForSelectedRow {
            var destinationVC = segue.destination as? CharacterDetailViewController
            let character = CharacterController.sharedInstance.characters[indexPath.row]
            destinationVC?.characters
        }
    }
}

