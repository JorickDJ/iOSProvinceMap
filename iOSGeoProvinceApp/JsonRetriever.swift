//
//  JsonRetriever.swift
//  iOSGeoProvinceApp
//
//  Created by Jorick de Jong on 28/09/15.
//  Copyright © 2015 Jorick de Jong. All rights reserved.
//

import Foundation
import Alamofire


class JsonRetriever {
    
    let url: String = "http://geodata.nationaalgeoregister.nl/bestuurlijkegrenzen/wfs?service=WFS&version=2.0.0&request=GetFeature&typename=provincies&outputformat=json"
    
    func fetchy(onComplete: (NSDictionary) -> Void) {
        Alamofire.request(.GET, url).responseJSON { request, response, data in
            onComplete(data.value as! NSDictionary)
        }
    }
}