//
//  SettingsView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    @State private var isOnboardnigShown = false
    @State private var isNotificationShown = false
    
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
                    
                    Text("Settings")
                        .foregroundStyle(.white)
                        .bold()
                    
                    
                    Spacer()
                    
                    HStack {}
                        .frame(width: 50)
                }
                
                ScrollView {
                    Button {
                        isOnboardnigShown.toggle()
                    } label: {
                        HStack {
                            Text("How To Use")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    }
                    .frame(height: 50)
                    
                    Button {
                        openFeedback(url: "https://sites.google.com/view/prizerpickthesportbag/contact-us")
                    } label: {
                        HStack {
                            Text("Feedback")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    }
                    .frame(height: 50)
                    
                    Button {
                        openFeedback(url: "https://sites.google.com/view/prizerpickthesportbag/privacy-policy")
                    } label: {
                        HStack {
                            Text("Privacy Policy")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    }
                    .frame(height: 50)
                    
                    Button {
                        isNotificationShown.toggle()
                    } label: {
                        HStack {
                            Text("Reset All Data")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    }
                    .frame(height: 50)
                }
                .padding(.top)
                .scrollIndicators(.hidden)
            }
        }
        .fullScreenCover(isPresented: $isOnboardnigShown) {
            OnboardingView()
        }
        .alert("Are you sure?", isPresented: $isNotificationShown) {
            Button {
                RealmManager.shared.clearDatabase()
            } label: {
                Text("Yes")
            }
            Button {
                
            } label: {
                Text("No")
            }
        } message: {
            Text("All bags will be deleted and you will have to create them again.")
        }

    }
    
    func openFeedback(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView(path: .constant(NavigationPath()))
}
