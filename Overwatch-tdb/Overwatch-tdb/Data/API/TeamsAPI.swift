//
//  TeamsAPI.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 21/10/20.
//

import Foundation

protocol TeamAPIDelegate {
    func updateTeams(teams: [Team])
}

class TeamsAPI{
    
    private let apiAddres = "https://api.overwatchleague.com/"
    private let teamEndponint = "v2/teams"
    var delegate: TeamAPIDelegate?
    
    
    
    func ApiIsWorking(_ completionHandler: @escaping (Bool) -> Void) {
        if let url = URL(string: "https://api.overwatchleague.com"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,response,error) in
                if error != nil {
                    print("O erro foi: \(String(describing: error?.localizedDescription))")
                }
                
                let isOk = response?.getStatusCode() == 200 ? true : false
                print(response?.getStatusCode() ?? 0)
                print("Cheogu até aqui")
                completionHandler(isOk)
            }
            task.resume()
        }
    }
    
    func getData() -> () {
           let urlString = "\(apiAddres)/\(teamEndponint)"
           if let url = URL(string: urlString){
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url){(data,response,error) in
                   if error != nil {
                       print("Error")
                   }
                   
                   if let safeData = data {
                       let decode = JSONDecoder()
                       do {
                           let decoderData = try decode.decode([Team].self, from: safeData)
                           self.delegate?.updateTeams(teams: decoderData)
                       }
                       catch {
                           print("Error")
                       }
                   }
               }
               task.resume()
           }
           
       }
       
}
