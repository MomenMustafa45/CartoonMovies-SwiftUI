//
//  Person.swift
//  CartoonMovies
//
//  Created by mac user on 08/06/2026.
//

import Foundation
import Playgrounds


struct Person: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let gender: String
    let age: String
    let eyeColor: String
    let hairColor: String
    let films: [String]
    let species: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, gender, age, films, species, url
        
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
}

//
//#Playground {
//    let url = URL(string: "https://ghibliapi.vercel.app/people/267649ac-fb1b-11eb-9a03-0242ac130003")!
//    
//    do {
//        let (data, _) =  try await URLSession.shared.data(from: url)
//        
//        let person = try JSONDecoder().decode(Person.self, from: data)
//        
//        
//    } catch {
//        
//    }
//}

