//
//  SavedBagsDetailView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct SavedBagsDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    var bag: Bag
    
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
                    
                    Text(bag.name)
                        .foregroundStyle(.white)
                        .bold()
                    
                    Spacer()
                    
                    HStack {}
                        .frame(width: 50)
                }
                
                ScrollView {
                    LazyVGrid(columns: adaptiveColumn, spacing: 30) {
                        ForEach(Array(bag.bagItems), id: \.id) { item in
                            SavedBagItemsCell(image: item.image, name: item.name)
                        }
                    }
                    
                    Button {
                        UserDefaults.standard.setValue(String(bag.id.description), forKey: "mainBag")
                        path.removeLast(path.count)
                    } label: {
                        Rectangle()
                            .frame(width: size().width - 40, height: 70)
                            .cornerRadius(12)
                            .foregroundStyle(.purpleButton)
                            .overlay {
                                Text("Set as Your Main Bag")
                                    .foregroundStyle(.white)
                            }
                    }
                    .padding(.top)
                    
                    Button {
                        path.removeLast(path.count)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            RealmManager.shared.deleteBagById(idString: bag.id.description)
                        }
                    } label: {
                        Rectangle()
                            .frame(width: size().width - 40, height: 70)
                            .cornerRadius(12)
                            .foregroundStyle(.red)
                            .overlay {
                                Text("Delete")
                                    .foregroundStyle(.white)
                            }
                    }
                    .padding(.top)
                    .padding(.bottom, 150)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}


//#Preview {
//    SavedBagsDetailView(path: .constant(NavigationPath()), name: "Name")
//}
