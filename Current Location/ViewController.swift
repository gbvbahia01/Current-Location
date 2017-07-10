//
//  ViewController.swift
//  Current Location
//
//  Created by Guilherme B V Bahia on 10/07/17.
//  Copyright © 2017 Planet Bang. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

   var locationManager = CLLocationManager();
   
   @IBOutlet weak var mp: MKMapView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      locationManager.delegate = self;
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      let userLocation: CLLocation = locations[0]
      let latitude = userLocation.coordinate.latitude
      let longitude = userLocation.coordinate.longitude
      let latDelta: CLLocationDegrees = 0.001
      let lonDelta: CLLocationDegrees = 0.001
      let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
      let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
      let region = MKCoordinateRegion(center: location, span: span)
      self.mp.setRegion(region, animated: true)
   }

}

