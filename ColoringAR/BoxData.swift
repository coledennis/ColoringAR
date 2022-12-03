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
//    var selectedColor: SwiftUI.Color?
    var boxTrueColorVar = SwiftUI.Color.red
    
    var boxFilledIn: Bool = false
//
//    var opacity: Double {
//        var tempVar = 0.0
//        if selectedColor == boxTrueColorVar {
//            tempVar = 1.0
//        } else {
//            tempVar = 0.3
//        }
//        return tempVar
//    }
    
    required init(boxTrueColor: SwiftUI.Color) {
        super.init()
        self.model = ModelComponent(
            mesh: .generateBox(size: [0.01, 0.01, 0.01]),
            materials: [SimpleMaterial(color: .white, isMetallic: false)]
        )
        self.generateCollisionShapes(recursive: true)
        boxTrueColorVar = boxTrueColor
        self.name = "boxName"
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    func changeColor(selectedColor: SwiftUI.Color) {
        if selectedColor == boxTrueColorVar {
            model?.materials =  [SimpleMaterial(color: UIColor(boxTrueColorVar), isMetallic: false)]
            boxFilledIn = true
        }
    }
    
    func changeColor2(red: Int, green: Int, blue: Int) {
        
        model?.materials =  [SimpleMaterial(color: .init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1), isMetallic: false)]

    }
    
    func isSelectedColorBoxColor(selectedColor: SwiftUI.Color) {
        if !boxFilledIn {
            if selectedColor == boxTrueColorVar {
                model?.materials = [SimpleMaterial(color: .init(red: 1, green: 1, blue: 1, alpha: 1), isMetallic: false)]
                //            model?.materials =  [SimpleMaterial(color: .init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1), isMetallic: false)]
                //
            } else {
                model?.materials = [SimpleMaterial(color: .init(red: 1, green: 1, blue: 1, alpha: 0.2), isMetallic: false)]
                
            }
        }
//        self.model?.materials =
    }
    
}
