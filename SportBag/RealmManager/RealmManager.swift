//
//  RealmManager.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI
import RealmSwift

class Bag: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var bagItems = RealmSwift.List<BagItem>()
}

class BagItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var name: String
    @Persisted var image: Data
}

extension BagItem {
    static func getMOCK() -> BagItem  {
        let mock  = BagItem()
        mock.name = "Shoes"
        mock.image = UIImage(named: "Training Shoes1")?.pngData() ?? Data()
        
        return mock
    }
}

class RealmManager {
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    @ObservedResults(Bag.self) var bags
    
    func deleteBagById(idString: String) {
        do {
            if let objectId = try? ObjectId(string: idString) {
                if let bagToDelete = realm.object(ofType: Bag.self, forPrimaryKey: objectId) {
                    try realm.write {
                        realm.delete(bagToDelete.bagItems)
                        
                        realm.delete(bagToDelete)
                    }
                    print("Bag and its items deleted successfully!")
                } else {
                    print("Bag not found!")
                }
            } else {
                print("Invalid ObjectId string")
            }
        } catch {
            print("Error deleting bag: \(error.localizedDescription)")
        }
    }
    
    func clearDatabase() {
        do {
            try realm.write {
                let allBags = realm.objects(Bag.self)
                realm.delete(allBags)
                
                let allBagItems = realm.objects(BagItem.self)
                realm.delete(allBagItems)
            }
            print("Database cleared successfully!")
        } catch {
            print("Error clearing database: \(error.localizedDescription)")
        }
    }
    
    func findBagById(idString: String) -> Bag? {        
        if let objectId = try? ObjectId(string: idString) {
            let bag = realm.object(ofType: Bag.self, forPrimaryKey: objectId)
            return bag
        } else {
            print("Invalid ObjectId string")
            return nil
        }
    }
    
    func saveBag(name: String, items: [BagItem]) {
        let newBag = Bag()
        newBag.name = name
        for item in items {
            newBag.bagItems.append(item)
        }
        
        UserDefaults.standard.setValue(String(newBag.id.description), forKey: "mainBag")
        
        do {
            try realm.write {
                realm.add(newBag)
            }
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
}
