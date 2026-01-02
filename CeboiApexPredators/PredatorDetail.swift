//
//  PredatorDetail.swift
//  CeboiApexPredators
//
//  Created by ceboi on 01/01/26.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    let predator: ApexPredator
    @State var position: MapCameraPosition

    var body: some View {
        GeometryReader { geo in
            ScrollView { // scroll view mirip kaya VStack, bedanya klo VStack mulai dari tengah lalu tiap ada element yang nambah maka akan naik ke atas, sedangkan scroll view mulai dari atas
                ZStack (alignment: .bottomTrailing) {
                    // background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8),
                                                   Gradient.Stop(color: .black, location: 1)], startPoint: .top, endPoint: .bottom)
                        }
                    
                    // dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                // dino name
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    // current location
                    NavigationLink {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                    } label: {
                        Map(position: $position) {
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)
                        }
                    }
                    .frame(height: 125)
                    .clipShape(.rect(cornerRadius: 15))
                    .overlay(alignment: .trailing) {
                        Image(systemName: "greaterthan")
                            .imageScale(.large)
                            .font(.title3)
                            .padding(.trailing, 5)
                    }
                    .overlay(alignment: .topLeading) {
                        Text("Current Location")
                            .padding([.leading, .bottom], 5)
                            .padding(.trailing, 8)
                            .background(.black.opacity(0.33))
                            .clipShape(.rect(bottomTrailingRadius: 15))
                    }
                    
                    // appears in
                    Text("Appears In:")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("•" + movie)
                    }
                    
                    // movie moment
                    Text("Movie Moment")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    // link to webpage
                    Text("Read More:")
                        .font(.caption)
                    Link("Wikipedia", destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)// make tanda ! karna itu tandanya sudah pasti ada value link nya, kalau ga ada maka app akan crash, makanya dianjurkan untuk menggunakan ?? agar kita memberikan default value link nya
                }
                .padding()
                .padding(.bottom, 50)
                .frame(width: geo.size.width, alignment: .leading)
                
            }
        }
        .ignoresSafeArea()
        .toolbarBackground(.automatic)
    }
}

#Preview {
    let predator = Predators().apexPredators[0]
    NavigationStack {
        PredatorDetail(
            predator: predator,
            position:
            .camera(
                MapCamera(
                    centerCoordinate: predator.location,
                    distance: 30000
                )
            ))
        .preferredColorScheme(.dark)
    }
}
