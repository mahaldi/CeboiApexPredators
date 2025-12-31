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
                
                // current location
                
                // appears in
                
                // movie moment
                
                // link to webpage
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[0])
}
