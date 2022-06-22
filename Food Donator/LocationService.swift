//
//  LocationService.swift
//  Food Donator
//
//  Created by UTS on 22/6/2022.
//

import Foundation
import CoreLocation

class LocationService: NSObject {
    static let shared: LocationService = LocationService()
    let manager: CLLocationManager
    init(manager: CLLocationManager = .init()) {
        self.manager = manager
        super.init()
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    
}
