import Foundation

public struct Country: Decodable{
    let name : String
    let capital : String
}

public class TopLevelStorage {
        
    let url = "https://restcountries.eu/rest/v2/all"
    
    init() {
        let restObj = URL(string: url)
         
        URLSession.shared.dataTask(with: restObj!) { (data, response, error) in
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data!)
                    
                    //print(response)
                    if let httpResponse = response as? HTTPURLResponse {
                        print(httpResponse.statusCode)
                    }
                    for c in countries {
                        if (c.name.starts(with: "Peru")) {
                            let Peru = Country(name: c.name, capital: c.capital)
                            print(Peru.name)
                            print(Peru.capital)
                        }
                    }
                    
                } catch {
                    print(error)
                }
            
        }.resume()

        print("After REST call")
    }
}
