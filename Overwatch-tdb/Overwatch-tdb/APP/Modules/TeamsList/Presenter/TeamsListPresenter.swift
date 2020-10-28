//
//  Presenter.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 14/10/20.
//

import Foundation

class Presenter{
    var intercator = TeamsListInteractor()
    
    func getTeams() -> [Team]{
        return  intercator.returnData()
    }
    
}
