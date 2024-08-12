//
//  build.swift
//  enzottic.me.m
//
//  Created by Tyler McCormick on 8/11/24.
//

import Foundation
import Ink
import Html

enum Paths {
    static let currentDir = URL(fileURLWithPath: #file).deletingLastPathComponent()
    static let contents = currentDir.appendingPathComponent("../Content")
    static let pub = currentDir.appendingPathComponent("../Public")
}

extension Website {
    static func build()  {
        let content = WebsiteContent(from: Paths.contents)
        
        for page in content.pages {
            generateHtml(for: page)
        }
    }
    
    static func generateHtml(for page: Page) {
        // Write file
        let htmlString = render(page.content)
        
        let file = Paths.pub.appendingPathComponent(page.title + ".html")
        try! htmlString.write(to: file, atomically: true, encoding: .utf8)
    }
    
}
