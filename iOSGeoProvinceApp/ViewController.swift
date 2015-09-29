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
                let province: Province = Province(name: p["properties"]["provincienaam"].string!)
                
                for (sectionKey, section) in p["geometry"]["coordinates"] {
                    let provinceSection: ProvinceSection = ProvinceSection(id: Int(sectionKey)!)
                    
                    for (subSectionKey, subSection) in section {
                        let provinceSubSection: ProvinceSubSection = ProvinceSubSection(id: Int(subSectionKey)!)
                        
                        for (_, coords) in subSection {
                            // Add coordinates to subsection
                            let c = CLLocationCoordinate2D(latitude: coords[1].doubleValue, longitude: coords[0].doubleValue)
                            provinceSubSection.addCoordinates(c)
                        }
                        
                        // Add subsection to section
                        provinceSection.addSubSection(provinceSubSection)
                        print("fire")
                    }
                    
                    // Add section to province
                    province.addSection(provinceSection)
                }
                
                print(province.sections[0].subSections.count)
                //self.provinceController.addProvince(province)
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

