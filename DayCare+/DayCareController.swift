//
//  DayCareController.swift
//  DayCare+
//
//  Created by Samarth Parikh on 2016-09-14.
//  Copyright © 2016 Balantech. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class DayCareController: UIViewController, UISearchBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var DayCareLocationMap: MKMapView!
    
    var locationManager:CLLocationManager!
    var searchController:UISearchController!
    var annotation:MKAnnotation!
    var localSearchRequest:MKLocalSearchRequest!
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    var error:NSError!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
    @IBAction func ShowSearchBar(_ sender: AnyObject) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPin()
        
        DayCareLocationMap.delegate = self
        
        self.navigationItem.title = tabBarItem.title
        self.view.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "pattern"))
        
        let SwipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipes))
        let SwipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipes))
        SwipeLeft.direction = .left
        view.addGestureRecognizer(SwipeLeft)
        SwipeRight.direction = .right
        view.addGestureRecognizer(SwipeRight)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        focusMapView()
    }
    
    func swipes(sender:UISwipeGestureRecognizer) {
        if(sender.direction == .left){
            let selectedIndex: Int = self.tabBarController!.selectedIndex
            self.tabBarController!.selectedIndex = selectedIndex + 1 }
        if(sender.direction == .right){
            let selectedIndex: Int = self.tabBarController!.selectedIndex
            self.tabBarController!.selectedIndex = selectedIndex - 1
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: UISearchBar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        //1
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        if self.DayCareLocationMap.annotations.count != 0{
            annotation = self.DayCareLocationMap.annotations[0]
            self.DayCareLocationMap.removeAnnotation(annotation)
        }
        //2
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                let alertController = UIAlertController(title: nil, message: "Place Not Found", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            //3
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.DayCareLocationMap.centerCoordinate = self.pointAnnotation.coordinate
            self.DayCareLocationMap.addAnnotation(self.pinAnnotationView.annotation!)
        }
    }
    
    func addPin() {
//        let annotation = MKPointAnnotation()
//        let centerCoordinate = CLLocationCoordinate2D(latitude: 43.64, longitude: -79.68)
//        annotation.coordinate = centerCoordinate
//        annotation.title = "Balantech"
//        DayCareLocationMap.addAnnotation(annotation)
        
        let sikkim=DayCareLocation(title: "Sikkim", coordinate: CLLocationCoordinate2D(latitude: 27.8236356, longitude:88.556531))
        let delhi = DayCareLocation(title: "Delhi", coordinate: CLLocationCoordinate2D(latitude: 28.619570, longitude: 77.088104))
        let kashmir = DayCareLocation(title: "Kahmir", coordinate: CLLocationCoordinate2D(latitude: 34.1490875, longitude: 74.0789389))
        let gujrat = DayCareLocation(title: "Gujrat", coordinate: CLLocationCoordinate2D(latitude: 22.258652, longitude: 71.1923805))
        let kerala = DayCareLocation(title: "Kerala", coordinate: CLLocationCoordinate2D(latitude: 9.931233, longitude:76.267303))
        
        DayCareLocationMap.addAnnotation(sikkim)
        DayCareLocationMap.addAnnotation(delhi)
        DayCareLocationMap.addAnnotation(kashmir)
        DayCareLocationMap.addAnnotation(gujrat)
        DayCareLocationMap.addAnnotation(kerala)
        
        DayCareLocationMap.addAnnotations([sikkim, delhi, kashmir, gujrat, kerala])
    }
    
    func focusMapView() {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        //manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
        
        DayCareLocationMap.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
        myAnnotation.title = "You are here"
        myAnnotation.subtitle = "My name is Samarth Parikh. I am 25 years old"
        DayCareLocationMap.addAnnotation(myAnnotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        let reuseID = "test"
        
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            anView?.image = UIImage(named:"Pin.png")
            anView?.canShowCallout = true
        }
        else {
            anView?.annotation = annotation
        }
        
        return anView
    }

    
}
