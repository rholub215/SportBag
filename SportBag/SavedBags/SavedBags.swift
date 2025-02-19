//
//  SavedBags.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct SavedBags: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    @State private var bags: [Bag] = []
    
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
                    
                    Text("Saved Bags")
                        .foregroundStyle(.white)
                        .bold()
                    
                    Spacer()
                    
                    HStack {}
                        .frame(width: 50)
                }
                
                if bags.isEmpty {
                    VStack {
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(width: size().width - 20, height: size().height / 1.2)
                            .foregroundStyle(.blueCard)
                            .cornerRadius(12)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 3)
                                    .foregroundStyle(.grayCorner)
                            }
                            .overlay {
                                VStack {
                                    Text("Oops... You don't have any saved bags yet.")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 24, weight: .black))
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Image("bag1Image")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .opacity(0.5)
                                    
                                    Text("You can do this on the screen \n«Choose Training»")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 24, weight: .black))
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Button {
                                        path.removeLast(path.count)
                                    } label: {
                                        Rectangle()
                                            .frame(width: size().width - 60, height: 70)
                                            .cornerRadius(12)
                                            .foregroundStyle(.purpleButton)
                                            .overlay {
                                                Text("Back To Home")
                                                    .font(.system(size: 24, weight: .black))
                                                    .foregroundStyle(.white)
                                            }
                                    }
                                    .padding(.top)
                                }
                            }
                        
                        Spacer()
                    }
                } else {
                    ScrollView {
                        ForEach(bags, id: \.id) { bag in
                            Button {
                                path.append(bag)
                            } label: {
                                SavedBagCell(bag: bag)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .onAppear {
            bags = Array(RealmManager.shared.bags)
        }
    }
}

#Preview {
    SavedBags(path: .constant(NavigationPath()))
}
