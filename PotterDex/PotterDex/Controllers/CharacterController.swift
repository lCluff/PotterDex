//
//  CharacterController.swift
//  PotterDex
//
//  Created by Leah Cluff on 6/13/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

class CharacterController {
    
    static let sharedInstance = CharacterController()
    var characters: [Character] = []
  
    
    //Mark- fetch and build URL
    func fetchCharacters(searchTerm: String, completion: @escaping(Character?) -> Void) {
        
        guard let baseURL = URL(string: "https://www.potterapi.com/v1/") else {return}
        let characterComponent = baseURL.appendingPathComponent("characters")
        var components = URLComponents(url: characterComponent, resolvingAgainstBaseURL: true)
        let apiKeyQueryItem = URLQueryItem(name: "key", value: "$2a$10$pDhP5PFuOFcOoAKhc1YJn.HwCYJC/Sqb1Wc.7V4Mn4guZQhJWdy2i")
        components?.queryItems = [apiKeyQueryItem]
        
        guard let finalURL = components?.url else{ completion(nil); return}
        
        print(finalURL)
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Oh h*ck, we ran out of floo powder \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else { completion(nil); return}
            let decoder = JSONDecoder()
            
            do {
                let characters = try decoder.decode([Character].self, from: data)
                print(characters.count)
                self.characters = characters
                completion(characters.first)
            } catch {
                print(error)
                completion(nil)
                return
            }
        }
        dataTask.resume()
    }
}

