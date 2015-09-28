//
//  ViewController.swift
//  iOSGeoProvinceApp
//
//  Created by Jorick de Jong on 28/09/15.
//  Copyright © 2015 Jorick de Jong. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let provinceController = ProvinceController()
    var provincePoints: [CLLocationCoordinate2D] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: Load JSON from server
        let jf = JsonFetcher()
        jf.fetchy { (j: JSON) -> Void in
            for (_, p):(String, JSON) in j["features"] { // Loop through provinces
                let provName: String = p["properties"]["provincienaam"].string!
                let provMaps = []
                
                for (_, maps) in p["geometry"]["coordinates"] { // Loop through maps
                    for (_, cords) in maps { // Loop through coordinates
//                        let long = cords[0][0].double!
//                        let lat = cords[0][1].double!
                        print(cords)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

