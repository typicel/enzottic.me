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
    var pageContent: Node { get }
}

extension Page {
    var content: Node {
        .html(
            .head(
                .title(self.title),
                .meta(attributes: [.charset(.utf8)]),
                .meta(attributes: [.init("http-equiv", "X-UA-Compatible"), .init("content", "IE=edge")]),
                .meta(attributes: [.init("name", "viewport"), .content("width=device-width, initial-scale=1.0")]),
                .link(attributes: [.rel(.icon), .type(.image(.png)), .init("sizes", "32x32"), .href("/favicon-32x32.png")]),
                .link(attributes: [.rel(.icon), .type(.image(.png)), .init("sizes", "16x16"), .href("/favicon-16x16.png")]),
                .link(attributes: [.init("rel", "manifest"), .href("/site.webmanifest")]),
                .link(attributes: [.rel(.stylesheet), .href("https://cdn.jsdelivr.net/gh/kimeiga/bahunya/dist/bahunya.min.css")])
            ),
            .body(
                self.body,
                .footer(
                    .p("© enzo 20XX • last modified 8/12/2024")
                )
            )
        )
    }
}
