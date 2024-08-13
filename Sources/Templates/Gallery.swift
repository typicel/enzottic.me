//
//  Gallery.swift
//  enzottic.me.m
//
//  Created by Tyler McCormick on 8/12/24.
//

import Foundation
import Html

struct Gallery: Page {
    var title: String
    var pageContent: Html.Node

    var body: Html.Node {
        .main(
            .h1("Photography Portfolio"),
            .a(attributes: [.href("https://typicel.darkroom.com")], "Purchase Prints"),
            .div(attributes: [.class("grid")],
                 .div(attributes: [.class("grid-sizer")]),
                 pageContent
            ),
            .script(attributes: [.init("type", "module"), .src("./js/gallery.js")])
        )
    }
}
