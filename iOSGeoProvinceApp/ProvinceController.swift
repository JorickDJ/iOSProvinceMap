//
//  ProvinceController.swift
//  iOSGeoProvinceApp
//
//  Created by RWM Horvers on 28/09/15.
//  Copyright © 2015 Jorick de Jong. All rights reserved.
//

import Foundation

class ProvinceController {
    
    var provinces: [Province] = []
    
    required init() {
        //
    }
    
    func addProvince(p: Province) {
        provinces.append(p)
    }
    
    func getProvinceByName(n: String) -> Province? {
        for p in provinces {
            if p.name == n {
                return p
            }
        }
        
        return nil
    }
    
    func getProvinces() -> [Province] {
        return provinces
    }
}
