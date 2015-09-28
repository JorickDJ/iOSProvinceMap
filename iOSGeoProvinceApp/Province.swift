//
//  Province.swift
//  iOSGeoProvinceApp
//
//  Created by RWM Horvers on 28/09/15.
//  Copyright © 2015 Jorick de Jong. All rights reserved.
//

import Foundation

class Province {
    
    var name: String?
    var coordinates: [Int : [Int : [Int : Double]]]?
    
    required init(name: String, coordinates: [Int : [Int : [Int : Double]]]) {
        self.name = name;
        self.coordinates = coordinates
    }
}
