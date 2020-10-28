//
//  Interactor.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 14/10/20.
//

import Foundation

class TeamsListInteractor{
    
    //MARK: - Private properties
    
    private var dados:[Team] = []
    
    //MARK: - Private Methods
    
    func loadData(){
        dados = DataSource().getTeams()
    }
    
    //MARK: - Init
    init() {
        loadData()
    }
    
    //Public Methods
    public func returnData() -> [Team] {
            return dados
    }
    
}
