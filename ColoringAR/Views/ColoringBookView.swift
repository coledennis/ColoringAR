//
//  ColoringBookView.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/22/22.
//

import SwiftUI

struct ColoringBookView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            .onTapGesture(coordinateSpace: .global) { location in
                arViewModel.raycast(location: location)
            }
    }
}

struct ColoringBookView_Previews: PreviewProvider {
    static var previews: some View {
        ColoringBookView(arViewModel: ARViewModel.init())
    }
}
