//
//  FeedView.swift
//  LeagueMobileChallenge
//
//  Created by Amanda Hanig Brust on 04/12/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import UIKit

class FeedView: UIView {
    
    lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        $0.separatorStyle = .singleLine
        $0.estimatedRowHeight = 89
        $0.rowHeight = UITableView.automaticDimension
        return $0
    }(UITableView())
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        setupTableView()
    }
    
    private func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
