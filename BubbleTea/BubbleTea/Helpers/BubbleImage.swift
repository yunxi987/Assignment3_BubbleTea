//
//  BubbleImage.swift
//  BubbleTea
//
//  Created by Lingjing Zhou on 7/5/2024.
//

import SwiftUI

// Defines a reusable view for displaying images in a circle.
struct BubbleImage: View {
    
    var image: Image // Holds the image to be displayed, passed in when the view is instantiated.
    
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
