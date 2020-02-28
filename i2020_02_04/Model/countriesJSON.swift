//
//  countriesJSON.swift
//  i2020_02_04
//
//  Created by Jasper Cruz on 2/23/20.
//  Copyright © 2020 Bradford, Phillip. All rights reserved.

import Foundation

class TopLevelStorage {
    
init() {
        
let url = "https://restcountries.eu/rest/v2/all"
    
let restObj = URL(string: url)
    
    
struct Country : Decodable {
    let name : String
    let capital : String
    let region : String
}
         
        URLSession.shared.dataTask(with: restObj!) { (data, response, error) in
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data!)
                    
                    //print(response)
                    if let httpResponse = response as? HTTPURLResponse {
                        print(httpResponse.statusCode)
                    }
                    for c in countries {
                        if (c.name.starts(with: "Z")) {
                            print(c.name)
                        }
                    }
                    
                } catch {
                    print(error)
                }
            
            }.resume()

        print("After REST call")
    }
}
