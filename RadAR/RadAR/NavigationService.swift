//
//  NavigationService.swift
//  ARTest
//
//  Created by Anna Isacson on 2018-02-14.
//  Copyright © 2018 RadAR. All rights reserved.
//

import MapKit
import CoreLocation

struct NavigationService {
    func getDirections(destination: CLLocationCoordinate2D, mkrequest: MKDirectionsRequest, completion: @escaping ([MKRouteStep]) -> Void) {
        var steps: [MKRouteStep] = []
        
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitude))
        mkrequest.destination = MKMapItem.init(placemark: placemark)
        mkrequest.source = MKMapItem.forCurrentLocation()
        mkrequest.requestsAlternateRoutes = false
        mkrequest.transportType = .walking
        
        let directions = MKDirections(request: mkrequest)
        
        directions.calculate { response, error in
            if error != nil {
                print("Error in calculating directions")
            } else {
                guard let response = response else {return}
                for route in response.routes {
                    steps.append(contentsOf: route.steps)
                    print("Here in \(route.expectedTravelTime/60) mins")
                    print(route.advisoryNotices)
                }
                completion(steps)
            }
        }
    }
}
