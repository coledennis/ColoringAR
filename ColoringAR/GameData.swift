//
//  GameData.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/22/22.
//

import Foundation

enum GameStage: CaseIterable {
    case tutorial, menu, stageSelection, coloringBook
    
    var string: String {
        switch self {
        case .menu:
            return "Menu"
        case .tutorial:
            return "Tutorial"
        case .stageSelection:
            return "Stage Selection"
        case .coloringBook:
            return "Coloring Book"
        }
    }
    
//    var color: Color {
//        switch self {
//        case .tutorial:
//            return .red
//        case .singlePlayer:
//            return .green
//        case .menu:
//            return .clear
//        case .ending:
//            return .clear
//        case .hotPotato:
//            return .blue
//        case .countUpEnding:
//            return .clear
//
//        }
//    }
    
//    var icon: String {
//        switch self {
//        case .singlePlayer: return "person"
//        case .menu:
//            return "list.bullet"
//        case .ending:
//            return "xmark"
//        case .hotPotato:
//            return "arrow.turn.up.forward.iphone"
//        case .countUpEnding:
//            return "xmark"
//        case .tutorial:
//            return "person.fill.questionmark"
//        }
//    }
}
