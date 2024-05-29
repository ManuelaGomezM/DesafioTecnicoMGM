//
//  UserLocationViewController.swift
//  DesafioTecnico
//
//  Created by Manuela on 29/05/2024.
//

import Foundation
import UIKit
import GoogleMaps

class UserLocationViewController: UIViewController {
    private let viewModel: UserLocationViewModel
    private var mapView: GMSMapView!
    private var mapContainerView: UIView!
    private var tabBarHeight: CGFloat = 0

    
    init(viewModel: UserLocationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        tabBarHeight = tabBarController?.tabBar.frame.height ?? 0
        view.backgroundColor = .white
        setupMapContainerView()
        showUserLocation()
        super.viewDidLoad()
    }
    
    private func setupMapContainerView() {
        mapContainerView = UIView()
        mapContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapContainerView)
        
        NSLayoutConstraint.activate([
            mapContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -tabBarHeight),
            mapContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])

        mapView = GMSMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapContainerView.addSubview(mapView)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: mapContainerView.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: mapContainerView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: mapContainerView.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: mapContainerView.bottomAnchor)
        ])
    }

    private func showUserLocation() {
        guard let latitude = CLLocationDegrees(viewModel.user.address.geo.lat),
              let longitude = CLLocationDegrees(viewModel.user.address.geo.lng) else {
            print("Error converting latitude and longitude to CLLocationDegrees")
            return
        }
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = viewModel.user.firstname
        marker.map = mapView
            
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 10.0)
            mapView.camera = camera
    }
}
