//
//  build.swift
//  enzottic.me.m
//
//  Created by Tyler McCormick on 8/11/24.
//

import Foundation
import Html
import Markdown

extension Website {
    static func build()  {
        let pages = createPages(from: Paths.contents)
        for page in pages {
            generateHtml(for: page)
        }
        generateGalleryPage()
    }
    
    static func createPages(from dir: URL) -> [Page] {
        var pages: [Page] = []
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: dir, includingPropertiesForKeys: nil)
            
            for file in fileURLs where file.pathExtension == "md" {
                let page = parsePage(for: file)
                pages.append(page)
            }
        } catch {
            fatalError("Could not create pages")
        }
        
        return pages
    }
    
    static func parsePage(for file: URL) -> Page {
        let document = try! Document(parsing: file)
        var parser = MarkdownToHTMLParser()
        let html = parser.visit(document)
        
        return Webpage(title: file.lastPathComponent.replacingOccurrences(of: ".md", with: "").capitalized, pageContent: html)
    }

    static func generateGalleryPage() {
        // Gallery page
        guard let data = try? Data(contentsOf: Paths.images) else { return }
        guard let images = try? JSONDecoder().decode([ImageData].self, from: data) else { return }
        
        let html: [Node] = images.map { image in
            return .div(attributes: [.class("grid-item")],
                .img(src: image.src, alt: image.info),
                .p(attributes: [.class("caption")], "\(image.info)")
            )
        }
        
        let gallery = Gallery(title: "Gallery", pageContent: .fragment(html))
        generateHtml(for: gallery)
    }
     
    static func generateHtml(for page: Page) {
        // Write file
        let htmlString = render(page.content)
        
        let file = Paths.pub.appendingPathComponent(page.title + ".html")
        try! htmlString.write(to: file, atomically: true, encoding: .utf8)
    }   
}
