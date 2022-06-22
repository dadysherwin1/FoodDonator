//
//  LocationDetail.swift
//  Food Donator
//
//  Created by UTS on 22/6/2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct LocationDetail: View {
    let destination: GeoPoint
    @State var userLocation: GeoPoint
    private let locationManager: CLLocationManager = CLLocationManager()
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.883214, longitude: 151.200623), span: .init(latitudeDelta: 0.02, longitudeDelta: 0.2))
    
    var body: some View {
        LocationView(positions: [destination, userLocation])
    }
    
    init(destination: GeoPoint = GeoPoint(latitude: -33.874192, longitude: 151.206696)) {
        self.destination = destination
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        if let location = locationManager.location {
        
            userLocation = GeoPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        } else {
            userLocation = GeoPoint(latitude: -33.876298, longitude: 151.206078)
        }
    }
}

struct LocationDetail_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetail()
    }
}
