//
//  DayCareLocation.swift
//  DayCare+
//
//  Created by Samarth Parikh on 2016-09-28.
//  Copyright © 2016 Balantech. All rights reserved.
//

import Foundation
import MapKit

class DayCareLocation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
