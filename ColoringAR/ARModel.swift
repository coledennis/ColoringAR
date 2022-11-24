//
//  ARModel.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/20/22.
//

import Foundation
import RealityKit
import SwiftUI
import CoreHaptics

struct ARModel {
    var collectionOfCubes = [SIMD3(x: 0, y: 0, z: 0),SIMD3(x: 0.11, y: 0, z: 0), SIMD3(x: 0.22, y: 0.11, z: 0)]
    private(set) var arView : ARView
    
    
    // MARK: Game Setup
    var gameStageVar: GameStage = .menu
    var engine: CHHapticEngine?
    var experiencePlaced: Bool = false
    
    init() {
        arView = ARView(frame: .zero)
        
    }
    
    mutating func changeGameStage( _ newGameStage: GameStage) {
        gameStageVar = newGameStage
    }
    
    
    // detect when I tap on a SPAWNED OBJECT not part of .reality file
    
    mutating func raycasting(location: CGPoint) {
        prepareHaptics()
        guard let query = arView.makeRaycastQuery(from: location/*arView.center*/,
                                                  allowing: .estimatedPlane,
                                                  alignment: .any)
        else { return }
        
        guard let result = arView.session.raycast(query).first
                
        else { return }
        print("result = \(result)")
        if let nearestEntity = arView.entity(at: location) as? CustomBox {
            print("tapping an existing square - \(nearestEntity.name)")
            
            nearestEntity.changeColor()
            
        } else {
            if experiencePlaced == false {
                let raycastAnchor = AnchorEntity(world: result.worldTransform)
                raycastAnchor.name = "raycast anchor"
                
                for box in placeGridOfCubes(parent: raycastAnchor) {
                    raycastAnchor.addChild(box)
                    print("added box = \(box.transform.translation)")
                }
                
                arView.scene.anchors.append(raycastAnchor)
                buttonTapHaptic()
                experiencePlaced = true
            }
        }
    }
    
    func placeGridOfCubes(parent: AnchorEntity) -> Array<Entity> {
        
        var array: Array<Entity> = []
        
        for item in collectionOfCubes {
            let box = CustomBox(color: .white)
            //                        box.name = "custom box"
            box.transform.translation.x = Float(item.x)
            box.transform.translation.y = Float(item.y)
            box.transform.translation.z = Float(item.z)
//            box.move(to: , relativeTo: <#T##Entity?#>, duration: <#T##TimeInterval#>, timingFunction: .)
            array.append(box)
        }
        
//        for xnum in 1...5 {
//            for ynum in 1...5 {
//                for znum in 1...5 {
//                    if xnum > ynum || ynum > znum {
//                        let box = CustomBox(color: .init(red: 1, green: 1, blue: 1, alpha: 1))
//                        box.name = "custom box"
//                        box.transform.translation.x = Float(0.11 * Float(xnum))
//                        box.transform.translation.y = Float(0.11 * Float(ynum))
//                        box.transform.translation.z = Float(0.11 * Float(znum))
//                        array.append(box)
//                    }
//                }
//            }
//        }
        return array
    }
    
    // MARK: Haptic Setup
    mutating func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func buttonTapHaptic() {
        let impactMed = UIImpactFeedbackGenerator(style: .light)
        impactMed.impactOccurred()
    }
    
    
}
