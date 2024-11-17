//
//  Page.swift
//  enzottic.me.m
//
//  Created by Tyler McCormick on 8/12/24.
//

import Foundation
import Html

protocol Page {
    var title: String { get }
    var body: Node { get }
    var head: ChildOf<Tag.Html> { get }
    var pageContent: Node { get }
}

extension Page {
    var content: Node {
        .html(
            self.head,
           .body(
                .nav(
                    .a(attributes: [.href("/")], "Home"),
                    .a(attributes: [.href("/now")], "Now"),
                    .a(attributes: [.href("/projects")], "Projects"),
                    .a(attributes: [.href("/gallery")], "Gallery")
                ),
                self.body,
                .footer(
                    .p("© enzo 20XX • last modified 11/16/2024")
                )
            )
        )
    }
}
