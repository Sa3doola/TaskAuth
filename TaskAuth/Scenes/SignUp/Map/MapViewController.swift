//
//  MapViewController.swift
//  TaskAuth
//
//  Created by Saad Sherif on 9/14/21.
//

import UIKit
import GoogleMaps

protocol LocationDataDelegate: NSObjectProtocol {
    func sendLocationBack(lat: Double, lng: Double, address: String)
}

class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    var marker = GMSMarker()
    var locationManager = CLLocationManager()
    weak var delegate: LocationDataDelegate?
    
    var address: String!
    var lat: Double!
    var lng: Double!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: GMSMapView!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.locationManager.requestWhenInUseAuthorization()
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                self.locationManager.startUpdatingLocation()
            }
        }
        self.mapView.delegate = self
    }
    
    // MARK: - IBActions
    
    @IBAction func submitLocationWasTapped(_ sender: UIButton) {
        if self.lat != nil {
            self.delegate?.sendLocationBack(lat: self.lat,
                                            lng: self.lng,
                                            address: self.address)
            navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - CLLocationManagerDelegate and GMSMapViewDelegate

extension MapViewController: CLLocationManagerDelegate, GMSMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        marker.position = CLLocationCoordinate2D(latitude: lat,
                                                 longitude: lng)
        self.lat = lat
        self.lng = lng
        
        let camera = GMSCameraPosition.camera(withLatitude: lat,
                                              longitude: lng,
                                              zoom: 14.0)
        self.mapView.camera = camera
        self.mapView.settings.myLocationButton = true
        marker.map = self.mapView
        marker.title = ""
        marker.icon = #imageLiteral(resourceName: "Marker")
        marker.isDraggable = true
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 5, y: 0, width: 300, height: 60))
        view.backgroundColor = #colorLiteral(red: 0.2111717463, green: 0.5481383801, blue: 0.5634632111, alpha: 1)
        view.layer.cornerRadius = 12
        
        let title = UILabel(frame: CGRect(x: 5, y: 7, width: view.width - 15, height: view.height - 10))
        title.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title.text = address
        title.textAlignment = .center
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 3
        view.addSubview(title)
        
        return view
    }
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinate) { (response, error) in
            guard let address = response?.firstResult(), let lines = address.lines else { return }
            self.address = lines.joined(separator: "\n")
            print("adress: \(String(describing: self.address))")
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func placeMarker(marker: GMSMarker, latitude: Double, longitude: Double) {
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.icon = #imageLiteral(resourceName: "Marker")
        marker.map = mapView
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        reverseGeocodeCoordinate(position.target)
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        marker.position = coordinate
        reverseGeocodeCoordinate(coordinate)
    }
}
