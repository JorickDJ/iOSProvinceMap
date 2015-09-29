//
//  ProvinceCoordinates.swift
//  iOSGeoProvinceApp
//
//  Created by RWM Horvers on 29/09/15.
//  Copyright © 2015 Jorick de Jong. All rights reserved.
//

import Foundation
import MapKit

class ProvinceSubSection {
    
    let id: Int
    var coordinates: [CLLocationCoordinate2D] = []
    
    required init(id: Int) {
        self.id = id;
    }
    
    func addCoordinates(c: CLLocationCoordinate2D) {
        self.coordinates.append(c)
    }
}
