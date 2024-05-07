//
//  ModelData.swift
//  BubbleTea
//
//  Created by 周灵婧 on 6/5/2024.
//

import Foundation

// Observable object class
class ModelData: ObservableObject {
    @Published var bubbleTeas: [BubbleTea] = load("bubbleTeaData.json")
}

// Generic function to load data from a JSON file
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
