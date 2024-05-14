//
//  BubbleImage.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 7/5/2024.
//

import SwiftUI

struct BubbleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
    }
}

#Preview {
    BubbleImage(image: Image("BubbleMilkTea"))
}
