//
//  ARViewModel.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/20/22.
//

import Foundation
import RealityKit
import SwiftUI

class ARViewModel: ObservableObject {
    @Published private var model : ARModel = ARModel()
    
    var arView : ARView {
        model.arView
    }
    
    var currentGameStage: GameStage {
        model.gameStageVar
    }
    
    var experiencePlaced: Bool {
        model.experiencePlaced
    }
    
    func changeGameStage( _ gameStage: GameStage) {
        model.changeGameStage(gameStage)
    }
    
    func raycast(location: CGPoint) {
        model.raycasting(location: location)
    }
    
    var currentColor: SwiftUI.Color? {
        model.currentColor
    }
    
    func changeCurrentColor(_ newColor: SwiftUI.Color) {
        model.changeCurrentColor(newColor)
    }
    
    func currentColorCheck() {
        model.currentColorCheck()
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
    
    var colorArr: Array<SwiftUI.Color> {
        model.colorArr
    }
    
}
