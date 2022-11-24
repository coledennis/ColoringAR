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
//    var collectionOfCubes = [SIMD3(x: 0, y: 0, z: 0),SIMD3(x: 0.11, y: 0, z: 0), SIMD3(x: 0.22, y: 0.11, z: 0)]
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
        

//        if let path = Bundle.main.path(forResource: "Torus", ofType: "json") {
//            do {
//                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                  if let collectionOfCubes = jsonResult as? JSONContent, let person = collectionOfCubes["person"] as? [Any] {
//                            // do stuff
//                  }
//              } catch {
//                   // handle error
//              }
//        }
        let collectionOfCubes = loadData().content.voxels.voxel
        
        for item in collectionOfCubes {
            print("collection of cubes = \(collectionOfCubes.count)")
            let box = CustomBox(color: .white)
            //                        box.name = "custom box"
            box.transform.translation.x = Float(Float(item.position.x)*0.01)
            box.transform.translation.y = Float(Float(item.position.y)*0.01)
            box.transform.translation.z = Float(Float(item.position.z)*0.01)
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
    
 
    func loadData() -> Welcome {
//        guard let url = URL(string: together
//        ) else {
//            print("Invalid URL")
//            return
//        }
        var result: Welcome = Welcome.init(content: Content.init(dimensions: .init(width: 0, height: 0, depth: 0), voxels: Voxels(voxel: [])))
//      private var results = [DrinkDetailsResult]()
        print("loadData running")
                if let path = Bundle.main.path(forResource: "snowman", ofType: "json") {
                    do {
                        print("test 1")
                          let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                          let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                        if let decodedResponse = try? JSONDecoder().decode(Welcome.self, from: data) {
                            result = decodedResponse
                            print("decoded")
                            //                results = decodedResponse.results
//                            results = decodedResponse.drinks
                        }
                        print("test 2")
//                          if let collectionOfCubes = jsonResult as? JSONContent, let person = collectionOfCubes["person"] as? [Any] {
                                    // do stuff
//                          }
                      } catch {
                           // handle error
                      }
                }
        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(DrinkDetailsResponse.self, from: data) {
//                //                results = decodedResponse.results
//                results = decodedResponse.drinks
//            }
//
//        } catch {
//            print("Invalid data")
//        }
        return result
    }

    
}
