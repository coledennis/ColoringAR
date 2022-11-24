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
    
    func changeColor2(red: Int, green: Int, blue: Int) {
        
        model?.materials =  [SimpleMaterial(color: .init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1), isMetallic: false)]

    }
}
