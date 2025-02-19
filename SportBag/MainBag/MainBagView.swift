//
//  MainBagView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct MainBagView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    @State private var mainBag: Bag = Bag()
    @State private var counter = 0
    
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
                    
                    Text(mainBag.name)
                        .foregroundStyle(.white)
                        .bold()
                    
                    
                    Spacer()
                    
                    HStack {}
                        .frame(width: 50)
                }
                
                if !mainBag.name.isEmpty {
                    if counter != mainBag.bagItems.count {
                        ScrollView {
                            Text("Choose what you already have in your bag")
                                .foregroundStyle(.white)
                                .font(.system(size: 24, weight: .black))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top)
                            
                            LazyVGrid(columns: adaptiveColumn, spacing: 30) {
                                ForEach(Array(mainBag.bagItems), id: \.id) { item in
                                    MainBagCell(image: item.image, name: item.name) { int in
                                        counter += int
                                    }
                                }
                                .padding(.top)
                            }
                        }
                        .scrollIndicators(.hidden)
                    } else {
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
                                        Spacer()
                                        
                                        Image("completeImage")
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                        
                                        
                                        Text("Bag is packed! You’re ready to train!")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 24, weight: .black))
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                        
                                        Text("Sometimes the hardest part of going to the gym is just getting there. Once you're there, you might as well workout.")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 18, weight: .light))
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top)
                                        
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
                                        
                                        Spacer()
                                    }
                                }
                            
                            Spacer()
                        }
                        
                        
                    }
                } else {
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
                                    Text("Oops... You don't have a saved bag yet.")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 24, weight: .black))
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Image("bag1Image")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .opacity(0.5)
                                    
                                    Text("You can do this on the screen \n«Saved Bags»")
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
                }
            }
        }
        .onAppear {
            getBag()
        }
    }
    
    func getBag() {
        if let id = UserDefaults.standard.string(forKey: "mainBag") {
            if let bag = RealmManager.shared.findBagById(idString: id) {
                mainBag = bag
            }
        }
    }
}

#Preview {
    MainBagView(path: .constant(NavigationPath()))
}
