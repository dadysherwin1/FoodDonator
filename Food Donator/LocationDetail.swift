//
//  LocationDetail.swift
//  Food Donator
//
//  Created by UTS on 22/6/2022.
//

import SwiftUI
import MapKit

struct LocationDetail: View {
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.883214, longitude: 151.200623), span: .init(latitudeDelta: 0.02, longitudeDelta: 0.2))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct LocationDetail_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetail()
    }
}
