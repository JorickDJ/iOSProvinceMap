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

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let provinceController = ProvinceController()
    var provincePoints: [CLLocationCoordinate2D] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: Load JSON from server
        let jf = JsonFetcher()
        jf.fetchy { (j: JSON) -> Void in
            self.onProvincesLoaded(j, onComplete: { () -> Void in
                let province: Province = self.provinceController.getProvinceByName("Noord-Brabant")!
                self.drawBorder(province)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func drawBorder(province: Province) {
        mapView.delegate = self
        
        for section in province.sections {
            for sub in section.subSections {
                let geoPolyLine = MKPolyline(coordinates: &sub.coordinates, count: sub.coordinates.count)
                self.mapView.addOverlay(geoPolyLine)
            }
        }
    }
    
    func onProvincesLoaded(j: JSON, onComplete: () -> Void) {
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
                }
                
                // Add section to province
                province.addSection(provinceSection)
            }
            
            self.provinceController.addProvince(province)
        }
        
        onComplete()
    }
    
    
    // MARK:- MapViewDelegate methods
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        
        polylineRenderer.strokeColor = UIColor.redColor()
        polylineRenderer.lineWidth = 10
        polylineRenderer.alpha = 0.5
        
        return polylineRenderer
    }
}

