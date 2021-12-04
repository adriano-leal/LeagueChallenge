//
//  FeedViewController.swift
//  LeagueMobileChallenge
//
//  Created by Amanda Hanig Brust on 04/12/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
    typealias View = FeedView
    typealias ViewModel = FeedViewModel
    
    var viewModel: ViewModel
    private let customView = View()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 140 }
    
}
