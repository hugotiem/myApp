//
//  MapViewController.swift
//  MyApp2
//
//  Created by Benjamin GOGO on 05/03/2022.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate{
    

    var restaurant: Restaurant!
    var locations: [CLLocation]!
    let locationManager = CLLocationManager()

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLocations()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func initLocations(){
        locations = [restaurant.getCoordinate()];
        addAnnotations(coords: locations)
    }
    
    
 
    
    func addAnnotations(coords: [CLLocation]){
            for coord in coords{
                let CLLCoordType = CLLocationCoordinate2D(
                    latitude: coord.coordinate.latitude,
                    longitude: coord.coordinate.longitude);
                
                let anno = MKPointAnnotation();
                anno.title = restaurant.name
                anno.coordinate = CLLCoordType;
                mapView.addAnnotation(anno);
            }
        mapView.showAnnotations(mapView.annotations, animated: true)
        }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
    
    
}
