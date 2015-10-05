//
//  JsonRetriever.swift
//  iOSGeoProvinceApp
//
//  Created by Jorick de Jong on 28/09/15.
//  Copyright © 2015 Jorick de Jong. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class JsonFetcher {
    
    let url: String = "http://geodata.nationaalgeoregister.nl/bestuurlijkegrenzen/wfs?service=WFS&version=2.0.0&request=GetFeature&typename=provincies&srsName=EPSG:4326&outputformat=json"
    
    func fetchy(onComplete: (JSON) -> Void) {
        
        Alamofire.request(.GET, url)
            .responseString { response in
                
            // Get raw result string
            let r = response.2.value!;
            
            // Convert string to JSON
            if let dataFromString = r.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                let json = JSON(data: dataFromString)
                onComplete(json)
            }
        }
    }
}