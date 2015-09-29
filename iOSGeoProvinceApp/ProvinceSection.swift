//
//  ProvinceSection.swift
//  iOSGeoProvinceApp
//
//  Created by RWM Horvers on 29/09/15.
//  Copyright © 2015 Jorick de Jong. All rights reserved.
//

import Foundation

class ProvinceSection {
    
    let id: Int
    var subSections: [ProvinceSubSection] = []
    
    required init(id: Int) {
        self.id = id
    }
    
    func addSubSection(c: ProvinceSubSection) {
        self.subSections.append(c)
    }
}
