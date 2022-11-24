//
//  BoxData.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/20/22.
//

import Foundation
import RealityKit
import SwiftUI

class CustomBox: Entity, HasModel, HasCollision {
    required init(color: UIColor) {
        super.init()
        self.model = ModelComponent(
            mesh: .generateBox(size: [0.01, 0.01, 0.01]),
            materials: [SimpleMaterial(color: color, isMetallic: false)]
        )
        self.generateCollisionShapes(recursive: true)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    func changeColor() {
        model?.materials =  [SimpleMaterial(color: .blue, isMetallic: false)]
    }
}
