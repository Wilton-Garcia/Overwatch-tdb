//
//  ViewController.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 30/09/20.
//

import UIKit

class TeamsListViewController: UIViewController {
    
    
    //MARK: - Private Properties
    
    private let tableView = UITableView()
    private var myView = TeamsListView()
    var dados:[Team]!

    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
        dados = DataSource().getTeams()
    }
    
    //MARK: - Private Methods

}
extension UIApplication {

   var statusBarView: UIView? {
      return value(forKey: "statusBar") as? UIView
    }

}
