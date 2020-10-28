//
//  View.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 07/10/20.
//

import UIKit



final class TeamsListView: UIView {
    
    //MARK: - Private properties
    //private let teamListViewController = TeamsListViewController()
    var data:[Team] = []
    
    private let viewBackground: UIView = {
        let viewBackground = UIView()
        viewBackground.backgroundColor = .OverwatchColorDarkBlue
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        return viewBackground
    }()
    
    private let logoImageView: UIImageView = {
        let uiImage = UIImage(named: "overwatchlogo")
        let imageView = UIImageView(image: uiImage)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textLogo: UILabel = {
        let uiLabel = UILabel()
        uiLabel.text = "OVERWATCH TEAMS"
        uiLabel.textAlignment = .justified
        uiLabel.textColor = .OverwatchColorOrange
        uiLabel.font = uiLabel.font.boldItalic
        uiLabel.font = uiLabel.font.withSize(29)
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    }()
    
    private let underTextBarLogo: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .OverwatchColorOrange
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private let tableTeamsList: UITableView = {
        let uiTableView = UITableView()
        uiTableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        uiTableView.translatesAutoresizingMaskIntoConstraints = false
        return uiTableView
    }()
    
    //MARK: - Private Methods
    private func setupLayout(){
        setupBackground()
        setupTableView()
        setupLogo()
    }
    
    private func setupBackground(){
        addSubview(viewBackground)
        
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewBackground.heightAnchor.constraint(equalTo: heightAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupLogo(){
        setupLogoImage()
        setupLogoText()
        setupLogoUnderTextBar()
    }
    
    private func setupLogoImage() {
        viewBackground.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 15),
            logoImageView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 10),
            logoImageView.bottomAnchor.constraint(equalTo: tableTeamsList.topAnchor, constant: -10),
            logoImageView.heightAnchor.constraint(equalToConstant: 75),
            logoImageView.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func setupLogoText() {
        viewBackground.addSubview(textLogo)
        
        NSLayoutConstraint.activate([
            textLogo.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: 25),
            textLogo.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
            textLogo.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -10),
            textLogo.widthAnchor.constraint(equalToConstant: 275)
        ])
    }
    
    private func setupLogoUnderTextBar() {
        viewBackground.addSubview(underTextBarLogo)
        
        NSLayoutConstraint.activate([
            underTextBarLogo.topAnchor.constraint(equalTo: textLogo.bottomAnchor, constant: 1),
            underTextBarLogo.leadingAnchor.constraint(equalTo: textLogo.leadingAnchor),
            underTextBarLogo.trailingAnchor.constraint(equalTo: textLogo.trailingAnchor),
            underTextBarLogo.heightAnchor.constraint(equalToConstant: 10),
            underTextBarLogo.widthAnchor.constraint(equalTo: textLogo.widthAnchor)
            
        ])
    }
    
    private func setupTableView(){
        viewBackground.addSubview(tableTeamsList)
        tableTeamsList.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableTeamsList.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableTeamsList.allowsSelection = false
        
        NSLayoutConstraint.activate([
            tableTeamsList.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 100),
            tableTeamsList.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 10),
            tableTeamsList.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -10),
            tableTeamsList.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor)
        ])
    }
    
    //MARK: - Init
    convenience init() {
        self.init(frame:.zero)
        
        setupLayout()
        tableTeamsList.dataSource = self
        tableTeamsList.delegate = self
    }
}
//MARK: - Extensions TableViewDataSource
extension TeamsListView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let team = data[indexPath.row]
        cell.fillCell(team: team)
        addExtaLayoutConfigsToTableView()
        return cell
    }
    private func addExtaLayoutConfigsToTableView(){
        tableTeamsList.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableTeamsList.backgroundColor = .none
    }
    
}
//MARK: - Extensions TableViewDelegate
extension TeamsListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return isIphone() ? 150 : 200
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
