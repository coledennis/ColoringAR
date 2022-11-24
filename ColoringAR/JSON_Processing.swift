//
//  JSON_Processing.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/23/22.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let content: Content
}

// MARK: - Content
struct Content: Codable {
    let dimensions: Dimensions
    let voxels: Voxels
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Int
}

// MARK: - Voxels
struct Voxels: Codable {
    let voxel: [Voxel]
}

// MARK: - Voxel
struct Voxel: Codable {
    let position: Position
    let color: Color
}

// MARK: - Color
struct Color: Codable {
    let red, green, blue: Int
}

// MARK: - Position
struct Position: Codable {
    let x, y, z: Int
}
