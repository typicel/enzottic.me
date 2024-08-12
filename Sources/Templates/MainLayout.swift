//
//  index.swift
//  enzottic.me.m
//
//  Created by Tyler McCormick on 8/11/24.
//

import Html

struct Webpage: Page {
    var title: String
    var pageContent: Node
    
    var body: Html.Node {
        .div(
            .nav(
                .a(attributes: [.href("/")], "Home"),
                .a(attributes: [.href("/now")], "Now"),
                .a(attributes: [.href("/projects")], "Projects"),
                .a(attributes: [.href("/gallery")], "Gallery")
            ),
            
            pageContent
        )
    }
}
