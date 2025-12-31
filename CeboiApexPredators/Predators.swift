//
//  Predators.swift
//  CeboiApexPredators
//
//  Created by ceboi on 31/12/25.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data  = try Data(contentsOf: url) // try nya ga perlu "?" karna udh ada catch
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("error: \(error)")
            }
        }
    }
}
