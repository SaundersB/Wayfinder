//
//  GPS_Trip_Analysis_Controller.swift
//  Wayfinder
//
//  Created by Brandon_Saunders on 7/17/16.
//  Copyright © 2016 Brandon_Saunders. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class DiscoverViewController : UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled())
        {
            print("Location services are enabled")
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        else {
            print("Location services are not enabled.")
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        print("Location manager.")
        
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.map.setRegion(region, animated: true)
    }
}