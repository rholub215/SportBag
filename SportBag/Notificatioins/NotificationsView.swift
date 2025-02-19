//
//  NotificationsView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct NotificationsView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
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
                    
                    Text("Notifications")
                        .foregroundStyle(.white)
                        .bold()
                    
                    
                    Spacer()
                    
                    HStack {}
                        .frame(width: 50)
                }
                
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
                                Text("You have no notifications.")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 24, weight: .black))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Image("bag1Image")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .opacity(0.5)
                               
                                
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
}

#Preview {
    NotificationsView(path: .constant(NavigationPath()))
}
