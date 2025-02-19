//
//  BagDetailView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct BagDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    var equiplentList: [Equipment]
    var bagName: String
    @State private var listToEdit: [Equipment] = []
    @State private var isEdited = false
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150, maximum: 250))
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlueBG)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    .frame(width: 50)
                    
                    Spacer()
                    
                    Text(bagName)
                        .foregroundStyle(.white)
                        .bold()
                    
                    Spacer()
                    
                    HStack {}
                        .frame(width: 50)
                }
                if !isEdited {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumn, spacing: 30) {
                            ForEach(listToEdit, id:\.self) { type in
                                EqCell(equipment: type)
                            }
                        }
                        .padding(.top)
                        
                        if !listToEdit.isEmpty {
                            Button {
                                DispatchQueue.main.async {
                                    RealmManager.shared.saveBag(name: bagName, items: prepareToSave())
                                }
                                path.removeLast(path.count)
                            } label: {
                                Rectangle()
                                    .frame(width: size().width - 40, height: 70)
                                    .cornerRadius(12)
                                    .foregroundStyle(.purpleButton)
                                    .overlay {
                                        Text("Save This Bag")
                                            .foregroundStyle(.white)
                                    }
                            }
                            .padding(.top)
                        }
                       
                        
                        Button {
                            withAnimation {
                                isEdited.toggle()
                            }
                        } label: {
                            Rectangle()
                                .frame(width: size().width - 40, height: 70)
                                .cornerRadius(12)
                                .foregroundStyle(.greenButton)
                                .overlay {
                                    Text("Customize")
                                        .foregroundStyle(.black)
                                }
                        }
                        .padding(.top)
                        .padding(.bottom, 150)
                    }
                    .scrollIndicators(.hidden)
                } else {
                    ScrollView {
                        VStack {
                            ForEach($listToEdit, id:\.id) { eq in
                                EqSmallCell(equipment: eq){
                                    withAnimation {
                                        if let index = listToEdit.firstIndex(where: { $0.id == eq.id.wrappedValue }) {
                                            listToEdit.remove(at: index)
                                        }
                                    }
                                }
                            }
                            
                            Button {
                                let newEquipment = Equipment(id: UUID(), name: "")
                                withAnimation {
                                    listToEdit.append(newEquipment)
                                }
                            } label: {
                                Rectangle()
                                    .frame(width: size().width - 40, height: 70)
                                    .cornerRadius(12)
                                    .foregroundStyle(.white)
                                    .overlay {
                                        Text("Add Equipment")
                                            .foregroundStyle(.black)
                                    }
                            }
                            .padding(.top)
                            
                            if let name = listToEdit.first?.name, !name.isEmpty {
                                Button {
                                    removeEmptyEquipments(from: &listToEdit)
                                    withAnimation {
                                        isEdited.toggle()
                                    }
                                } label: {
                                    Rectangle()
                                        .frame(width: size().width - 40, height: 70)
                                        .cornerRadius(12)
                                        .foregroundStyle(.greenButton)
                                        .overlay {
                                            Text("Done")
                                                .foregroundStyle(.black)
                                        }
                                }
                                .padding(.top)
                                .padding(.bottom, 150)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                
            }
        }
        .onAppear {
            if !equiplentList.isEmpty {
                withAnimation {
                    listToEdit = equiplentList
                }
            } else {
                withAnimation {
                    isEdited.toggle()
                }
            }
            
        }
    }
    //
    
    func prepareToSave() -> [BagItem] {
        var items: [BagItem] = []
                
        for equipment in listToEdit {
            let itemToAdd = BagItem()
            
            itemToAdd.name = equipment.name
            
            
            
            if let photo = equipment.image {
                if let imageData = photo.jpegData(compressionQuality: 1.0) {
                    itemToAdd.image = imageData
                }
            }
            
            if let photo = UIImage(named: equipment.name) {
                if let imageData = photo.pngData() {
                    itemToAdd.image = imageData
                }
            }
            if !equipment.name.isEmpty {
                items.append(itemToAdd)
            }
        }
        
        return items
    }
    
    
    func removeEmptyEquipments(from array: inout [Equipment]) {
        array.removeAll { equipment in
            equipment.name.isEmpty && equipment.image == nil
        }
    }
    //
}

#Preview {
    BagDetailView(path: .constant(NavigationPath()), equiplentList: [], bagName: "Boxing Bag")
}
