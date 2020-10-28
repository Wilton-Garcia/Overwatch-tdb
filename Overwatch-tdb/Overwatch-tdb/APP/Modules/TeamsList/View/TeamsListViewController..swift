//
//  ViewController.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 30/09/20.
//

import UIKit

class TeamsListViewController: UIViewController {
    //MARK: - Private Properties
    private let presenter = Presenter()
    private var myView = TeamsListView()
   // var data:[Team]!

    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
       //data = presenter.getTeams()
        myView.data = presenter.getTeams()
    }
    
    //MARK: - Private Methods

}
extension UIApplication {

   var statusBarView: UIView? {
      return value(forKey: "statusBar") as? UIView
    }

}
