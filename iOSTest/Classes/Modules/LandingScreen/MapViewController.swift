//
//  MapViewController.swift
//  iOSTest
//
//  Created by Shibin Moideen on 5/7/19.
//  Copyright © 2019 Shibin Moideen. All rights reserved.
//
import UIKit
import MapKit
class MapViewController: UIViewController {
    @IBOutlet weak var mapKitView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapKitView.isZoomEnabled = true
    }
}
