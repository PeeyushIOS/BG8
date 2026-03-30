//
//  mapPage.swift
//  BG8
//
//  Created by Mac HD on 25/02/2025.
//

import SwiftUI
import MapKit

struct mapPage: View {
    @State private var searchText = ""
    @StateObject private var locationManager = LocationManager()
    @State private var nearbyLocations: [RandomLocation] = []
    @State private var selectedLocationID: UUID? = nil
    @State private var slectedIndex: Int = 0
    let mapData: [mapItem] = [
        mapItem(title: "Golf Beach", imageName: "ti1"),
        mapItem(title: "Food Beach Short Course", imageName: "ti4"),
        mapItem(title: "Star Ring Course", imageName: "ti2"),
        mapItem(title: "Peebe Beach", imageName: "image"),
        mapItem(title: "Premium SportCourse", imageName: "ti3")
    ]

    var region: Binding<MKCoordinateRegion> {
        Binding(
            get: {
                if let location = locationManager.location {
                    return MKCoordinateRegion(
                        center: location,
                        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    )
                } else {
                    
                    return MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
                        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
                    )
                }
            },
            set: { _ in }
        )
    }
    var body: some View {
        ZStack {
            Map(coordinateRegion: region, annotationItems: nearbyLocations) { location in
                MapAnnotation(coordinate: location.coordinate) {

                    VStack(alignment: .leading,spacing: 5) {
                          if selectedLocationID == location.id {
                          
                              Text("\(mapData[nearbyLocations.firstIndex(where: { $0.id == location.id })!].title)\n10:00 AM $20-$30")
                                  .font(.system(size: 14,weight: .bold))
                            
                                  .padding(6)
                                  .background(.white)
                                  .cornerRadius(8)
                                  .shadow(radius: 3)
                          }
                          
                        Image( "map_pin")

                            .resizable()
                                 .frame(width: 25, height: 35) .shadow(radius: 5)
                              .onTapGesture {
                                  if selectedLocationID == location.id {
                                     
                                      selectedLocationID = nil
                                  } else {
                                      selectedLocationID = location.id
                                  }
                                  
                                  if let index = nearbyLocations.firstIndex(where: { $0.id == location.id }) {
                                                         print("Pin tapped: \(index)")
                                      slectedIndex = index
                                                     }
                                  
                            
                              }
                      }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onChange(of: locationManager.location) { newLocation in
                if let location = newLocation, nearbyLocations.isEmpty {
                    nearbyLocations = generateRandomLocations(around: location)
                }
            }

            if locationManager.location == nil {
                ProgressView("Fetching Location…")
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
            }

            VStack(alignment: .leading) {
                searchBarView(searchText: $searchText, backgroundColor: Color.white).padding(.top, 10)
                Spacer()
                courseCardView(title: mapData[slectedIndex].title, image: mapData[slectedIndex].imageName).padding(.bottom, 30)
            }
        }

    }
    func generateRandomLocations(around location: CLLocationCoordinate2D, count: Int = 5, minimumDistance: CLLocationDistance = 300) -> [RandomLocation] {
        var locations: [RandomLocation] = []
        var attempts = 0
        let maxAttempts = 1000

        while locations.count < count && attempts < maxAttempts {
            attempts += 1
            
            let latOffset = Double.random(in: -0.003...0.003)
            let lonOffset = Double.random(in: -0.003...0.003)
            
            let newCoord = CLLocationCoordinate2D(
                latitude: location.latitude + latOffset,
                longitude: location.longitude + lonOffset
            )
            
            let tooClose = locations.contains { existing in
                distanceInMeters(from: existing.coordinate, to: newCoord) < minimumDistance
            }
            
            if !tooClose {
                locations.append(RandomLocation(coordinate: newCoord))
            }
        }
        
        return locations
    }
    func distanceInMeters(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> CLLocationDistance {
        let loc1 = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let loc2 = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return loc1.distance(from: loc2)
    }
}

#Preview {
    mapPage()
}



struct RandomLocation: Identifiable  {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
struct mapItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}
