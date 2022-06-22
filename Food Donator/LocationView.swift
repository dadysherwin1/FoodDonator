//
//  LocationView.swift
//  Food Donator
//
//  Created by UTS on 22/6/2022.
//

import SwiftUI
import CoreLocation
import MapKit

struct LocationView : View {
    var positions : [GeoPoint]
    
    struct IdentifiablePoint: Identifiable {
        var id = UUID()
        var position : GeoPoint
    }
    
    var centerOfPoints : (center: CLLocationCoordinate2D, span: MKCoordinateSpan) {
        var minLat = 91.0
        var maxLat = -91.0
        var minLon = 181.0
        var maxLon = -181.0
        
        for i in positions {
            maxLat = max(maxLat, i.latitude)
            minLat = min(minLat, i.latitude)
            maxLon = max(maxLon, i.longitude)
            minLon = min(minLon, i.longitude)
        }
        
        let center = CLLocationCoordinate2D(latitude: (maxLat + minLat) / 2,
                                           longitude: (maxLon + minLon) / 2)
        
        let span = MKCoordinateSpan(latitudeDelta: abs(maxLat - minLat) * 1.3,
                                    longitudeDelta: abs(maxLon - minLon) * 1.3)
        return (center: center,
                span: span)
    }
    
    var body: some View {
        let center = centerOfPoints
        
        return Map(coordinateRegion: .constant(MKCoordinateRegion(center: center.center, span: center.span)), showsUserLocation: true, annotationItems: positions.map { IdentifiablePoint(position: $0)}) { (point) in
            MapPin(coordinate: CLLocationCoordinate2D(latitude: point.position.latitude,
                                                      longitude: point.position.longitude))
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(positions: [
            GeoPoint(latitude: -33.874192, longitude: 151.206696),
            GeoPoint(latitude: -33.876298, longitude: 151.206078)
        ])
    }
}

struct GeoPoint {
    var latitude: CGFloat
    var longitude: CGFloat
}
