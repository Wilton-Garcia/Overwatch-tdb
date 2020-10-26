//
//  TeamDAO.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 05/10/20.
//

import Foundation


class TeamDAO{
    let allTeams = [Team(Name: "Brazilians HUE HUE", AbbreveatedName: "brHUE", Location: "BRAZIL", Logo: "teamlogo"),
                    Team(Name: "China Dinasty", AbbreveatedName: "CND", Location: "CHINA", Logo: "teamlogo"),
                    Team(Name: "Commared From Russia", AbbreveatedName: "CFR", Location: "RUSSIA", Logo: "teamlogo"),
                    Team(Name: "Imperial Samurais", AbbreveatedName: "IS", Location: "JAPAN", Logo: "teamlogo"),
                    Team(Name: "Hermanitos", AbbreveatedName: "HER", Location: "ARGENTINA", Logo: "teamlogo"),
                    Team(Name: "Dragons Of Seul", AbbreveatedName: "DOS", Location: "SOUTH KOREA", Logo: "teamlogo")]
    
    func getAllTeams() -> [Team]{
        return allTeams
    }
    
    func getOneTeam() -> Team {
        return allTeams[0]
    }
    
    
}
