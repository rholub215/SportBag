//
//  DataManager.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

class Equipment: Hashable {
    var id: UUID
    var name: String
    var image: UIImage?
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
       static func == (lhs: Equipment, rhs: Equipment) -> Bool {
           return lhs.name == rhs.name
       }
       
       func hash(into hasher: inout Hasher) {
           hasher.combine(name)
       }
}

class DataManager {
    static let shared = DataManager()
    
    private init(){}
    
    let gym: [Equipment] = [
        Equipment(id: UUID(), name: "Training Shoes"),
        Equipment(id: UUID(), name: "Towel"),
        Equipment(id: UUID(), name: "Water Bottle"),
        Equipment(id: UUID(), name: "Gym Clothes"),
        Equipment(id: UUID(), name: "Protein Shake"),
        Equipment(id: UUID(), name: "Headphones"),
        Equipment(id: UUID(), name: "Lifting Gloves")
    ]
    
    let boxing: [Equipment] = [
        Equipment(id: UUID(), name: "Boxing Glove"),
        Equipment(id: UUID(), name: "Hand Wraps"),
        Equipment(id: UUID(), name: "Mouth Guard"),
        Equipment(id: UUID(), name: "Towel"),
        Equipment(id: UUID(), name: "Water Bottle"),
        Equipment(id: UUID(), name: "Training Shoes"),
        Equipment(id: UUID(), name: "Headgear")
    ]

    let yoga: [Equipment] = [
        Equipment(id: UUID(), name: "Yoga Mat"),
        Equipment(id: UUID(), name: "Yoga Blocks"),
        Equipment(id: UUID(), name: "Towel"),
        Equipment(id: UUID(), name: "Water Bottle"),
        Equipment(id: UUID(), name: "Comfortable Clothes"),
        Equipment(id: UUID(), name: "Strap"),
        Equipment(id: UUID(), name: "Essential Oil")
    ]

    let swimming: [Equipment] = [
        Equipment(id: UUID(), name: "Swimsuit"),
        Equipment(id: UUID(), name: "Towel"),
        Equipment(id: UUID(), name: "Goggles"),
        Equipment(id: UUID(), name: "Swim Cap"),
        Equipment(id: UUID(), name: "Flip-Flops"),
        Equipment(id: UUID(), name: "Shampoo & Soap"),
        Equipment(id: UUID(), name: "Water Bottle")
    ]

    let running: [Equipment] = [
        Equipment(id: UUID(), name: "Training Shoes"),
        Equipment(id: UUID(), name: "Towel"),
        Equipment(id: UUID(), name: "Water Bottle"),
        Equipment(id: UUID(), name: "Gym Clothes"),
        Equipment(id: UUID(), name: "Headphones"),
        Equipment(id: UUID(), name: "Fitness Tracker"),
        Equipment(id: UUID(), name: "Energy Gel")
    ]
}
