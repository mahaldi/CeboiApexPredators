//
//  ApexPredator.swift
//  CeboiApexPredators
//
//  Created by ceboi on 31/12/25.
//
import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "") // ubah nama dino di json jadi huruf kecil semua dan yang ada spasinya jadi tanpa spasi, biar sama dengan filename dari gambar dino di assets
    }
    
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
}

enum APType: String, Decodable, CaseIterable {
    case all
    case land
    case air
    case sea
    
    var background: Color {
        switch self {
        case .land:
            .brown
        case .air:
            .teal
        case .sea:
            .blue
        case .all:
            .black
        }
    }
    
    var icon: String {
        switch self {
        case .air:
            "wind"
        case .land:
            "leaf.fill"
        case .sea:
            "drop.fill"
        case .all:
            "square.stack.3d.up.fill"
        }
    }
}
