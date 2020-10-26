//
//  DataSource.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 05/10/20.
//

import Foundation

class DataSource {
    
    func getTeams() -> [Team]{
        return TeamDAO().getAllTeams()
    }
    
}
