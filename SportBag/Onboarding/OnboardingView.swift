//
//  OnboardingView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.darkBlueBG)
                .ignoresSafeArea()
            
            VStack {
               Image("smallLogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                
                Spacer()
                
                    .frame(width: size().width - 20, height: size().height / 1.3)
                    .foregroundStyle(.blueCard)
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 3)
                            .foregroundStyle(.grayCorner)
                    }
                    .overlay {
                        ScrollView {
                            VStack {
                                Text("Welcome")
                                    .foregroundStyle(LinearGradient(colors: [.yellow, .greenButton, .purpleButton], startPoint: .top, endPoint: .bottom))
                                    .font(.system(size: 48, weight: .black))
                                    .padding(.top)
                                
                                Text("Tired of always forgetting your gym essentials? This app is here to help you pack smart and never leave anything behind!")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 24, weight: .thin))
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                
                                Text("How it works:")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 32, weight: .black))
                                    .padding(.top)
                                
                                Text("""
1. Choose Your Bag: \nHead to the Choose Training screen to select a pre-made bag or create your own custom bag. Your selected bag automatically becomes your main bag.

- You can save multiple bags and manage them from the Saved Bags screen.

2. Pack with Confidence: \nGo to the Your Sportbag screen and simply tap on the items you've already packed. This way, you know exactly what’s left to add.

3. Set Reminders: \nNeed a little nudge? Set reminders on the Reminder screen to make sure you pack on time.
"""
                                )
                                    .foregroundStyle(.white)
                                    .font(.system(size: 24, weight: .thin))
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                
                                Text("""
With SportBag, you’re always ready to train. No more forgotten sneakers, water bottles, or headphones!

Let's pack and hit the gym! 🏋️‍♂️💪
""")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 24, weight: .thin))
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                
                                Button {
                                    dismiss()
                                } label: {
                                    Rectangle()
                                        .frame(width: size().width - 60, height: 70)
                                        .cornerRadius(12)
                                        .foregroundStyle(.purpleButton)
                                        .overlay {
                                            Text("Let's Roll")
                                                .font(.system(size: 24, weight: .black))
                                                .foregroundStyle(.white)
                                        }
                                }
                                .padding(.top)
                                .padding(.bottom, 50)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
