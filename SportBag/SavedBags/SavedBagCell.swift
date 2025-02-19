//
//  SavedBagCell.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct SavedBagCell: View {
    
    var bag: Bag
    
    var body: some View {
        Rectangle()
            .frame(width: size().width - 40, height: 100)
            .cornerRadius(12)
            .foregroundStyle(.blueCard)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.grayCorner)
            }
            .overlay {
                HStack {
                    Image("bag1Image")
                        .resizable()
                        .frame(width: 70, height: 70)
                    
                    Spacer()
                    
                    Text("\(bag.name)")
                        .foregroundStyle(.white)
                        .font(.system(size: 22, weight: .bold))
                    
                    Spacer()
                    
                    Text("x\(bag.bagItems.count)")
                        .foregroundStyle(.white)
                        .font(.system(size: 22, weight: .light))
                    
                }
                .padding(.horizontal)
            }
    }
        
}

#Preview {
    SavedBagCell(bag: Bag())
        .preferredColorScheme(.dark)
}
