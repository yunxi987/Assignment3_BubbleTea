//
//  ModelData.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 6/5/2024.
//

import Foundation
import Combine

class ModelData: ObservableObject {
    @Published var bubbleTeas: [BubbleTea] = []
    @Published var addOns: [AddOn] = []

    init() {
        loadBubbleTeas()
        loadAddOns()
    }

    private func loadBubbleTeas() {
        guard let url = Bundle.main.url(forResource: "BubbleTeaData", withExtension: "json") else {
            fatalError("Failed to locate BubbleTeaData.json in bundle.")
        }

        do {
            let data = try Data(contentsOf: url)
            bubbleTeas = try JSONDecoder().decode([BubbleTea].self, from: data)
        } catch {
            print("Error decoding BubbleTeas: \(error)")
            bubbleTeas = []
        }
    }

    private func loadAddOns() {
        guard let url = Bundle.main.url(forResource: "AddOnsData", withExtension: "json") else {
            fatalError("Failed to locate AddOnsData.json in bundle.")
        }

        do {
            let data = try Data(contentsOf: url)
            addOns = try JSONDecoder().decode([AddOn].self, from: data)
        } catch {
            print("Error decoding AddOns: \(error)")
            addOns = []
        }
    }
}




