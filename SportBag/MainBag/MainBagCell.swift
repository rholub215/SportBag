//
//  MainBagCell.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct MainBagCell: View {
    var image: Data
    var name: String
    
    var completion: (Int) -> ()
    
    @State private var isSelected = false
    
    var body: some View {
        Rectangle()
            .frame(width: size().width / 2.4, height: size().height / 4)
            .foregroundColor(.blueCard)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(isSelected ? .greenButton : .grayCorner)
                    
            }
            .shadow(color: isSelected ? .greenButton : .clear, radius: 5)
            .overlay {
                VStack {
                    Spacer()
                
                    
                    if let image = UIImage(data: image) {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                 
                    
                    Spacer()
                    
                    Text(name)
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .bold))
                    
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation {
                    isSelected.toggle()
                    
                    if isSelected {
                        completion(1)
                    } else {
                       completion(-1)
                    }
                }
            }
    }
}

#Preview {
    MainBagCell(image: Data(), name: "Some name"){ _ in}
        .preferredColorScheme(.dark)
}
