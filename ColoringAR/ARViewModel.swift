//
//  ARViewModel.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/20/22.
//

import Foundation
import RealityKit

class ARViewModel: ObservableObject {
    @Published private var model : ARModel = ARModel()
    
    var arView : ARView {
        model.arView
    }
    
    var currentGameStage: GameStage {
        model.gameStageVar
    }
    
    func changeGameStage( _ gameStage: GameStage) {
        model.changeGameStage(gameStage)
    }
    
    func raycast(location: CGPoint) {
        model.raycasting(location: location)
    }
    
    // MARK: Haptics
    func simpleSuccess() {
        model.simpleSuccess()
    }
    
    func buttonHaptic() {
        model.buttonTapHaptic()
    }

    func prepareHaptics() {
        model.prepareHaptics()
    }
    
}
