//
//  TableViewCell.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 06/10/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    private let contentCellView:UIView = {
       let uiView = UIView()
        uiView.layer.shadowColor = UIColor.black.cgColor
        uiView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        uiView.layer.shadowOpacity = 1.0
        uiView.layer.shadowRadius = 5
        uiView.layer.cornerRadius = 20
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private let teamNameLabel:UILabel = {
        let uiLabel = UILabel()
        uiLabel.textColor = .black
        if(isIphone()){
            uiLabel.font = .boldSystemFont(ofSize: 18)
        }
        else{
            uiLabel.font = .boldSystemFont(ofSize: 24)
        }
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    }()
    
    private let abbreveatedNameLabel:UILabel = {
        let uiLabel = UILabel()
        uiLabel.textColor = .black
        if(isIphone()){
            uiLabel.font = .boldSystemFont(ofSize: 16)
        }
        else{
            uiLabel.font = .boldSystemFont(ofSize: 22)
        }
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    }()
    
    private let locationLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.textColor = .black
        if(isIphone()){
            uiLabel.font = .boldSystemFont(ofSize: 15)
        }
        else{
            uiLabel.font = .boldSystemFont(ofSize: 21)
        }
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    }()
    
    private let logoView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private let logoImageView: UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        return uiImageView
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        setupView()
        createLabels()
        createLogo()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    // MARK: - Private Methods
    private func setupView(){
        
        addSubview(contentCellView)
        
        NSLayoutConstraint.activate([
            contentCellView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            contentCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            contentCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            contentCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
            
        ])
        
        contentCellView.backgroundColor = .OverwatchColorBlue
        self.layer.cornerRadius = 15
       
    }
    
    private func createLabels(){
        createTeamNameLabel()
        createAbbreveatedNameLabel()
        createLocationLabel()
    }
    
    private func createTeamNameLabel(){
        contentCellView.addSubview(teamNameLabel)
        NSLayoutConstraint.activate([
            teamNameLabel.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: 10),
            teamNameLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 10),
            teamNameLabel.widthAnchor.constraint(equalTo: contentCellView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func createAbbreveatedNameLabel(){
        contentCellView.addSubview(abbreveatedNameLabel)
        NSLayoutConstraint.activate([
            abbreveatedNameLabel.topAnchor.constraint(equalTo: teamNameLabel.topAnchor, constant: 30),
            abbreveatedNameLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 10),
            abbreveatedNameLabel.widthAnchor.constraint(equalTo: contentCellView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func createLocationLabel(){
        contentCellView.addSubview(locationLabel)
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: abbreveatedNameLabel.topAnchor, constant: 30),
            locationLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 10),
            locationLabel.widthAnchor.constraint(equalTo: contentCellView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func createLogo(){
        contentCellView.addSubview(logoView)
        
        logoView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: 10),
            logoView.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -20),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: logoView.topAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: logoView.trailingAnchor),
            logoImageView.heightAnchor.constraint(equalTo: logoView.heightAnchor),
            logoImageView.widthAnchor.constraint(equalTo: logoView.widthAnchor)
        ])
        
    }
    
    // MARK: - Public Methods
    func fillCell(team: Team){
        teamNameLabel.text = team.Name
        abbreveatedNameLabel.text = team.AbbreveatedName
        locationLabel.text = team.Location
        logoImageView.image = UIImage(named: team.Logo)
    }
    
}
