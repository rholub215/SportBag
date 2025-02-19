//
//  ChooseWorkoutView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct ChooseWorkoutView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    
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
                    
                    Text("Choose Trainig")
                        .foregroundStyle(.white)
                        .bold()
                    
                    Spacer()
                    
                    HStack {}
                        .frame(width: 50)
                }
                
                ScrollView {
                    VStack {
                        //MARK: - Gym
                        Button {
                            path.append("GymBag")
                        } label: {
                            Rectangle()
                                .frame(width: size().width - 40, height: 100)
                                .foregroundStyle(.blueCard)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.grayCorner)
                                }
                                .cornerRadius(12)
                                .overlay {
                                    HStack {
                                        Image("gymImage")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                        
                                        Text("Gym")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.leading, 10)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        
                        //MARK: - BoxingBag
                        Button {
                            path.append("BoxingBag")
                            
                        } label: {
                            Rectangle()
                                .frame(width: size().width - 40, height: 100)
                                .foregroundStyle(.blueCard)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.grayCorner)
                                }
                                .cornerRadius(12)
                                .overlay {
                                    HStack {
                                        Image("boxingImage")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                        
                                        Text("Boxing")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.leading, 10)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        
                        //MARK: - YogaBag
                        Button {
                            path.append("YogaBag")
                           
                        } label: {
                            Rectangle()
                                .frame(width: size().width - 40, height: 100)
                                .foregroundStyle(.blueCard)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.grayCorner)
                                }
                                .cornerRadius(12)
                                .overlay {
                                    HStack {
                                        Image("yogaImage")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                        
                                        Text("Yoga")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.leading, 10)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        
                        //MARK: - SwimmingBag
                        Button {
                            path.append("SwimmingBag")
                            
                        } label: {
                            Rectangle()
                                .frame(width: size().width - 40, height: 100)
                                .foregroundStyle(.blueCard)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.grayCorner)
                                }
                                .cornerRadius(12)
                                .overlay {
                                    HStack {
                                        Image("swimmingImage")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                        
                                        Text("Swimming")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.leading, 10)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        
                        //MARK: - RunningBag
                        Button {
                            path.append("RunningBag")
                            
                        } label: {
                            Rectangle()
                                .frame(width: size().width - 40, height: 100)
                                .foregroundStyle(.blueCard)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.grayCorner)
                                }
                                .cornerRadius(12)
                                .overlay {
                                    HStack {
                                        Image("runningImage")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                        
                                        Text("Running")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.leading, 10)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        
                        //MARK: - RunningBag
                        Button {
                            path.append("CustomBag")
                            
                        } label: {
                            Rectangle()
                                .frame(width: size().width - 40, height: 100)
                                .foregroundStyle(.blueCard)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.grayCorner)
                                }
                                .cornerRadius(12)
                                .overlay {
                                    HStack {
                                        Image("bag2Image")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                        
                                        Text("CustomBag")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.leading, 10)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        .padding(.bottom, 150)
                    }
                }
                .scrollIndicators(.hidden)
            }
            
        }
        
    }
}

#Preview {
    ChooseWorkoutView(path: .constant(NavigationPath()))
}
