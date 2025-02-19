//
//  EqView.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct EqCell: View {
    
    var equipment: Equipment
    
    var body: some View {
        Rectangle()
            .frame(width: size().width / 2.4, height: size().height / 4)
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
                    
                    if let image = equipment.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipped()
                            .cornerRadius(8)
                    }
                    
                    if let image = UIImage(named: equipment.name) {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                 
                    
                    Spacer()
                    
                    Text(equipment.name)
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .bold))
                    
                    Spacer()
                }
            }
    }
}

#Preview {
    EqCell(equipment: Equipment(id: UUID(), name: "Towel"))
        .preferredColorScheme(.dark)
}
