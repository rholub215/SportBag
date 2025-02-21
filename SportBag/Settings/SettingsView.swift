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
    
    @State private var isFeedbackShown = false
    @State private var isPolicied = false
    
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
                        isFeedbackShown.toggle()
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
                        isPolicied.toggle()
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
        .sheet(isPresented: $isFeedbackShown) {
            PrivacyPolicyWrapper(privacyURL: "https://sites.google.com/view/prizerpickthesportbag/contact-us")
                .presentationDetents([.height(size().height / 1.15)])
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
        .sheet(isPresented: $isPolicied) {
            PrivacyPolicyWrapper(privacyURL: "https://sites.google.com/view/prizerpickthesportbag/privacy-policy")
                .presentationDetents([.height(size().height / 1.15)])
        }

    }
}

#Preview {
    SettingsView(path: .constant(NavigationPath()))
}
