//
//  PostTableViewCell.swift
//  LeagueMobileChallenge
//
//  Created by Amanda Hanig Brust on 04/12/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    let mainView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
        
    let avatarImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "defaultImg")
        return $0
    }(UIImageView())
    
    let usernameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
        $0.text = "Adriano Ramos"
        return $0
    }(UILabel())
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
        $0.text = "League Challenge"
        return $0
    }(UILabel())
    
    let descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.text = "This is just a sample description to fill out this label here and my full name is Adriano Leal De Freitas Ramos and I live in Brazil."
        return $0
    }(UILabel())
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(mainView)
        mainView.addSubview(avatarImage)
        mainView.addSubview(usernameLabel)
        mainView.addSubview(titleLabel)
        mainView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        setupMainView()
        setupAvatar()
        setupUsernameLabel()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    private func setupMainView() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    private func setupAvatar() {
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 5),
            avatarImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            avatarImage.heightAnchor.constraint(equalToConstant: 50),
            avatarImage.widthAnchor.constraint(equalTo: avatarImage.heightAnchor)
        ])
    }
    
    private func setupUsernameLabel() {
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
        ])
    }
    
    private func setupTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: avatarImage.leadingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
        ])
    }
    
    private func setupDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
        ])
    }
    
}
