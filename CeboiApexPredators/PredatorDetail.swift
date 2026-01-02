//
//  PredatorDetail.swift
//  CeboiApexPredators
//
//  Created by ceboi on 01/01/26.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader { geo in
            ScrollView { // scroll view mirip kaya VStack, bedanya klo VStack mulai dari tengah lalu tiap ada element yang nambah maka akan naik ke atas, sedangkan scroll view mulai dari atas
                ZStack (alignment: .bottomTrailing) {
                    // background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
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
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[0])
}
