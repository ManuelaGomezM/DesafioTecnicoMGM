//
//  NewsDetailViewController.swift
//  DesafioTecnico
//
//  Created by Manuela on 29/05/2024.
//

import Foundation
import UIKit

protocol NewsDetailVCProtocol {
    var viewModel: NewsDetailViewModel { get set }
}

final class NewsDetailViewController: UIViewController, NewsDetailVCProtocol {
    var viewModel: NewsDetailViewModel
    private var tabBarHeight: CGFloat = 0


    init(viewModel: NewsDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
    }
    
    private func customizeUI() {
        view.backgroundColor = .white
        tabBarHeight = tabBarController?.tabBar.frame.height ?? 0

        let titleLabel = UILabel()
        titleLabel.text = viewModel.news.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let extraDataLabel = UILabel()
        extraDataLabel.text = "\(viewModel.news.category) - \(viewModel.news.publishedAt)"
        extraDataLabel.numberOfLines = 0
        view.addSubview(extraDataLabel)

        extraDataLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            extraDataLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            extraDataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            extraDataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: extraDataLabel.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -tabBarHeight)
        ])

        let bodyLabel = UILabel()
        bodyLabel.text = viewModel.news.content
        bodyLabel.numberOfLines = 0
        scrollView.addSubview(bodyLabel)

        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            bodyLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            bodyLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        scrollView.isScrollEnabled = true
    }

}
