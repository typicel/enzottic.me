//
//  File.swift
//  enzottic.me.m
//
//  Created by Tyler McCormick on 8/11/24.
//

import Foundation
import Markdown
import Html

struct WebsiteContent {
    var pages: [Page]
}

extension WebsiteContent {
    init(from dir: URL) {
        self.pages = []
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: dir, includingPropertiesForKeys: nil)
            
            for file in fileURLs where file.pathExtension == "md" {
                let page = parsePage(for: file)
                pages.append(page)
            }
        } catch {
            fatalError("Could not find contents of directory")
        }
    }
    
    func parsePage(for file: URL) -> Page {
        let document = try! Document(parsing: file)
        print(document.debugDescription())
        var parser = MarkdownToHTMLParser()
        let html = parser.visit(document)
        
        print(html)
        
        return Webpage(title: file.lastPathComponent, pageContent: html)
    }
}

