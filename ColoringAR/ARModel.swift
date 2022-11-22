//
//  ARModel.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/20/22.
//

import Foundation
import RealityKit

struct ARModel {
    private(set) var arView : ARView
    
    init() {
        arView = ARView(frame: .zero)
        
    }
    // detect when I tap on a SPAWNED OBJECT not part of .reality file
    
    mutating func raycasting(location: CGPoint) {
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
            
            let raycastAnchor = AnchorEntity(world: result.worldTransform)
            raycastAnchor.name = "raycast anchor"
            
            let box = CustomBox(color: .red)
            box.name = "custom box"
            
            raycastAnchor.addChild(box)
            
            arView.scene.anchors.append(raycastAnchor)
        }
    }
    
}
