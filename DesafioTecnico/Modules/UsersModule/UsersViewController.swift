//
//  HomeView.swift
//  ChallengeTecnico1
//
//  Created by Manuela on 28/05/2024.
//

import Foundation
import Combine
import UIKit

protocol UsersVCProtocol {
    var viewModel: UserViewModel { get set }
}

final class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UsersVCProtocol {
    var viewModel = UserViewModel()
    private let tableView = UITableView()
    private var cancellables: Set<AnyCancellable> = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        view.backgroundColor = .white
        
        setupTableView()
        
        viewModel.$users
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let userInfo = viewModel.users[indexPath.row]
        cell.textLabel?.text = "\(userInfo.firstname) \(userInfo.lastname)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = viewModel.users[indexPath.row]
        let mapViewModel = UserLocationViewModel(user: selectedUser)
        let mapVC = UserLocationViewController(viewModel: mapViewModel)
        navigationController?.pushViewController(mapVC, animated: true)
    }
}

