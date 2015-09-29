//
//  Province.swift
//  iOSGeoProvinceApp
//
//  Created by RWM Horvers on 28/09/15.
//  Copyright © 2015 Jorick de Jong. All rights reserved.
//

import Foundation

class Province {
    
    let name: String
    var sections: [ProvinceSection] = []
    
    required init(name: String) {
        self.name = name
    }
    
    func addSection(set: ProvinceSection) {
        self.sections.append(set)
    }
}
