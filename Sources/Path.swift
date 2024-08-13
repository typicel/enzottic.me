//
//  Path.swift
//  enzottic.me.m
//
//  Created by Tyler McCormick on 8/12/24.
//

import Foundation

enum Paths {
    static let currentDir = URL(fileURLWithPath: #file).deletingLastPathComponent()
    static let contents = currentDir.appendingPathComponent("../Content")
    static let pub = currentDir.appendingPathComponent("../Public")
    static let images = pub.appending(path: "images/images.json")
}
