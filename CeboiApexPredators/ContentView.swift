//
//  ContentView.swift
//  CeboiApexPredators
//
//  Created by ceboi on 31/12/25.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText: String = ""
    
    var filteredDinos : [ApexPredator] {
        guard !searchText.isEmpty else {
            return predators.apexPredators
        }
        return predators.apexPredators.filter {
            predator in predator.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    var body: some View {
        NavigationStack {
            List(filteredDinos) { predator in
                NavigationLink {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                } label: {
                HStack {
                    // dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .shadow(color: .white, radius: 1)
                    
                    VStack(alignment: .leading) {
                        // name
                        Text(predator.name)
                            .fontWeight(.bold)
                        // type
                        Text(predator.type.rawValue.capitalized)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 13)
                            .padding(.vertical, 5)
                            .background(predator.type.background)
                            .clipShape(.capsule)
                    }
                }}
            }
            .navigationTitle(Text("Ceboi descendant"))
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
