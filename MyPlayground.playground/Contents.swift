//: Playground - noun: a place where people can play

import UIKit
import CoreLocation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func checkLocation(location:CLLocation, completionHandler:@escaping (String)->Void) {
    geocoder.reverseGeocodeLocation(location) { (placemarks:[CLPlacemark]?, e:Error?) in
        guard let ps = placemarks else {
            print(e as! NSError)
            return
        }
        let placemark = ps.first!
        let info = "\(placemark.name!) || \(placemark.subLocality!) || \(placemark.locality!)"
        assert(placemark.locality! == "New York")
        completionHandler(info)
    }
}

let geocoder = CLGeocoder()
let locations:[CLLocation] = [
    // Brooklyn
    CLLocation(latitude: 40.681065, longitude: -73.975953),
    CLLocation(latitude: 40.608271, longitude: -73.929604),
    CLLocation(latitude: 40.663455, longitude: -73.864662),
    CLLocation(latitude: 40.729831, longitude: -73.943969),
    // Queens
    CLLocation(latitude: 40.740997, longitude: -73.718076),
    CLLocation(latitude: 40.660264, longitude: -73.757146),
    CLLocation(latitude: 40.793413, longitude: -73.813276),
    CLLocation(latitude: 40.785204, longitude: -73.781934),
    // The Bronx
    CLLocation(latitude: 40.806697, longitude: -73.916810),
    CLLocation(latitude: 40.858390, longitude: -73.910287),
    CLLocation(latitude: 40.898367, longitude: -73.871835),
    CLLocation(latitude: 40.901481, longitude: -73.850549),
    // Manhattan
    CLLocation(latitude: 40.835796, longitude: -73.942559),
    CLLocation(latitude: 40.804358, longitude: -73.945306),
    CLLocation(latitude: 40.779665, longitude: -73.966935),
    CLLocation(latitude: 40.728171, longitude: -73.999207),
    // Staten Island
    CLLocation(latitude: 40.6202915, longitude: -74.0716407), // Keish825keish825@gmail.com
    CLLocation(latitude: 40.512140, longitude: -74.241920),
    CLLocation(latitude: 40.598708, longitude: -74.058842),
    CLLocation(latitude: 40.646917, longitude: -74.080471),
    CLLocation(latitude: 40.635975, longitude: -74.171795),
]

var i = 0

func processLocations() {
    checkLocation(location: locations[i], completionHandler: { info in
        print(info)
        i = i+1
        if locations.count > i {
            processLocations()
        }
    })
}

processLocations()
