//
//  NewsDetailViewController.swift
//  DesafioTecnico
//
//  Created by Manuela on 29/05/2024.
//

import Foundation
import UIKit

class NewsDetailViewController: UIViewController {
    private let viewModel: NewsDetailViewModel

    init(viewModel: NewsDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = viewModel.news.title

        let label = UILabel()
        label.text = viewModel.news.body
        label.numberOfLines = 0
        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
