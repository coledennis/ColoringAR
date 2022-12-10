//
//  ContentView.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/20/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    var body: some View {
        VStack {
            switch arViewModel.currentGameStage {
            case .tutorial: Text("Tutorial")
            case .menu:
                TitleScreenView(arViewModel: arViewModel)
            case .stageSelection:
//                Text("Stage Selection")
                StageSelectionView(arViewModel: arViewModel)
            case .coloringBook:
                ColoringBookView(arViewModel: arViewModel)
            }
        }
//        TitleScreenView(arViewModel: arViewModel)
    }
    
}

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARView {
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
