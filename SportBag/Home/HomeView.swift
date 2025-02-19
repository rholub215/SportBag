//
//  HomeView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

extension View {
    func size() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}

struct HomeView: View {
    
    @State private var path = NavigationPath()
    @State private var isOnboardnigShown = false
    
    var body: some View {
        NavigationStack(path: $path) {
            
            ZStack {
                Rectangle()
                    .foregroundStyle(.darkBlueBG)
                    .ignoresSafeArea()
                
                VStack {
                    Image("logoImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: size().width - 40, height: 190)
                    ScrollView {
                        VStack {
                            HStack {
                                NavigationLink(value: "MainBag") {
                                    Rectangle()
                                        .frame(width: size().width / 2.4, height: size().height / 4.5)
                                        .foregroundColor(.blueCard)
                                        .cornerRadius(12)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: 2)
                                                .foregroundStyle(.grayCorner)
                                            
                                        }
                                        .overlay {
                                            VStack {
                                                Spacer()
                                                Image("bag1Image")
                                                    .resizable()
                                                    .frame(width: 70, height: 70)
                                                
                                                Text("Your Sportbag")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 18, weight: .bold))
                                                Spacer()
                                            }
                                        }
                                }
                                
                                NavigationLink(value: "ChooseView") {
                                    Rectangle()
                                        .frame(width: size().width / 2.4, height: size().height / 4.5)
                                        .foregroundColor(.blueCard)
                                        .cornerRadius(12)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: 2)
                                                .foregroundStyle(.grayCorner)
                                            
                                        }
                                        .overlay {
                                            VStack {
                                                Spacer()
                                                
                                                Image("trainingImage")
                                                    .resizable()
                                                    .frame(width: 70, height: 70)
                                                
                                                Text("Choose Trainig")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 18, weight: .bold))
                                                
                                                Spacer()
                                            }
                                        }
                                }
                            }
                            
                            HStack {
                                NavigationLink(value: "SavedBags") {
                                    Rectangle()
                                        .frame(width: size().width / 2.4, height: size().height / 4.5)
                                        .foregroundColor(.blueCard)
                                        .cornerRadius(12)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: 2)
                                                .foregroundStyle(.grayCorner)
                                            
                                        }
                                        .overlay {
                                            VStack {
                                                Spacer()
                                                Image("savedImage")
                                                    .resizable()
                                                    .frame(width: 70, height: 70)
                                                
                                                Text("Saved Bags")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 18, weight: .bold))
                                                Spacer()
                                            }
                                        }
                                }
                                
                                NavigationLink(value: "Reminder") {
                                    Rectangle()
                                        .frame(width: size().width / 2.4, height: size().height / 4.5)
                                        .foregroundColor(.blueCard)
                                        .cornerRadius(12)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: 2)
                                                .foregroundStyle(.grayCorner)
                                            
                                        }
                                        .overlay {
                                            VStack {
                                                Spacer()
                                                
                                                Image("notifIcon")
                                                    .resizable()
                                                    .frame(width: 70, height: 70)
                                                
                                                Text("Reminder")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 18, weight: .bold))
                                                
                                                Spacer()
                                            }
                                        }
                                }
                            }
                            
                            HStack {
                                NavigationLink(value: "Notifications") {
                                    Rectangle()
                                        .frame(width: size().width / 2.4, height: size().height / 4.5)
                                        .foregroundColor(.blueCard)
                                        .cornerRadius(12)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: 2)
                                                .foregroundStyle(.grayCorner)
                                            
                                        }
                                        .overlay {
                                            VStack {
                                                Spacer()
                                                Image("bellIcon")
                                                    .resizable()
                                                    .frame(width: 70, height: 70)
                                                
                                                Text("Notifications")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 18, weight: .bold))
                                                Spacer()
                                            }
                                        }
                                }
                                
                                NavigationLink(value: "Settings") {
                                    Rectangle()
                                        .frame(width: size().width / 2.4, height: size().height / 4.5)
                                        .foregroundColor(.blueCard)
                                        .cornerRadius(12)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: 2)
                                                .foregroundStyle(.grayCorner)
                                            
                                        }
                                        .overlay {
                                            VStack {
                                                Spacer()
                                                
                                                Image("gearImage")
                                                    .resizable()
                                                    .frame(width: 70, height: 70)
                                                
                                                Text("Settings")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 18, weight: .bold))
                                                
                                                Spacer()
                                            }
                                        }
                                }
                            }
                        }
                        .padding(.top)
                        .padding(.bottom, 150)
                    }
                    .scrollIndicators(.hidden)
                    
                    Spacer()
                }
            }
            .navigationDestination(for: Bag.self) { bag in
                SavedBagsDetailView(path: $path, bag: bag)
                    .navigationBarBackButtonHidden()
            }
            .navigationDestination(for: String.self) { value in // BoxingBag
                switch value {
                case "ChooseView":
                    ChooseWorkoutView(path: $path)
                        .navigationBarBackButtonHidden()
                case "BoxingBag":
                    BagDetailView(path: $path, equiplentList: DataManager.shared.boxing, bagName: "Boxing Bag")
                        .navigationBarBackButtonHidden()
                case "YogaBag":
                    BagDetailView(path: $path, equiplentList: DataManager.shared.yoga, bagName: "Yoga Bag")
                        .navigationBarBackButtonHidden()
                case "GymBag":
                    BagDetailView(path: $path, equiplentList: DataManager.shared.gym, bagName: "Gym Bag")
                        .navigationBarBackButtonHidden()
                case "SwimmingBag":
                    BagDetailView(path: $path, equiplentList: DataManager.shared.swimming, bagName: "Swimming Bag")
                        .navigationBarBackButtonHidden()
                case "RunningBag":
                    BagDetailView(path: $path, equiplentList: DataManager.shared.running, bagName: "Running Bag")
                        .navigationBarBackButtonHidden()
                case "SavedBags":
                    SavedBags(path: $path)
                        .navigationBarBackButtonHidden()
                case "CustomBag":
                    BagDetailView(path: $path, equiplentList: [], bagName: "Custom Bag")
                        .navigationBarBackButtonHidden()
                case "MainBag":
                    MainBagView(path: $path)
                        .navigationBarBackButtonHidden()
                case "Settings":
                    SettingsView(path: $path)
                        .navigationBarBackButtonHidden()
                case "Reminder":
                    ReminderView(path: $path)
                        .navigationBarBackButtonHidden()
                case "Notifications":
                    NotificationsView(path: $path)
                        .navigationBarBackButtonHidden()
                default:
                    ChooseWorkoutView(path: $path)
                }
            }
        }
        .onAppear {
            if !UserDefaults.standard.bool(forKey: "onboarding") {
                UserDefaults.standard.setValue(true, forKey: "onboarding")
                isOnboardnigShown = true
            }
        }
        .fullScreenCover(isPresented: $isOnboardnigShown) {
            OnboardingView()
        }
    }
    
}

#Preview {
    HomeView()
}
