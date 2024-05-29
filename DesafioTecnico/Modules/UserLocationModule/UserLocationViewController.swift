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
    
    init(viewModel: UserLocationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMapView() {
            mapView = GMSMapView(frame: .zero)
            mapView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(mapView)
            
            NSLayoutConstraint.activate([
                mapView.topAnchor.constraint(equalTo: view.topAnchor),
                mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }

        private func showUserLocation() {
            let marker = GMSMarker()
            marker.position = viewModel.user.location
            marker.title = viewModel.user.userName
            marker.map = mapView
            
            let camera = GMSCameraPosition.camera(withLatitude: viewModel.user.location.latitude, longitude: viewModel.user.location.longitude, zoom: 10.0)
            mapView.camera = camera
        }
}
