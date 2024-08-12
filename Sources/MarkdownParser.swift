//
//  File.swift
//  enzottic.me.m
//
//  Created by Tyler McCormick on 8/12/24.
//

import Foundation
import Html
import Markdown

func Div(attributes: [Attribute<Tag.Div>] = [], _ content: [Node]) -> Node {
    return .element("div", attributes: attributes, .fragment(content))
}

func Paragraph(attributes: [Attribute<Tag.P>] = [], _ content: [Node]) -> Node {
    return .element("p", attributes: attributes, .fragment(content))
}

func Link(attributes: [Attribute<Tag.A>] = [], _ content: [Node]) -> Node {
    return .element("a", attributes: attributes, .fragment(content))
}

func Header(_ heading: Markdown.Heading, attributes: [Attribute<Tag.Header>] = [], _ content: [Node]) -> Node {
    switch heading.level {
    case 1:
        return .element("h1", attributes: attributes, .fragment(content))
    case 2:
        return .element("h2", attributes: attributes, .fragment(content))
    case 3:
        return .element("h3", attributes: attributes, .fragment(content))
    case 4:
        return .element("h4", attributes: attributes, .fragment(content))
    case 5:
        return .element("h5", attributes: attributes, .fragment(content))
    case 6:
        return .element("h6", attributes: attributes, .fragment(content))
    default:
        return .element("p", attributes: attributes, .fragment(content))
    }
}

struct MarkdownToHTMLParser: MarkupVisitor {
    typealias Result = Node
    
    mutating func defaultVisit(_ markup: any Markup) -> Node {
        let transformed: [Node] = markup.children.map { visit($0) }
        return Div(transformed)
    }
    
    mutating func visitParagraph(_ paragraph: Paragraph) -> Node {
        let transofrmed: [Node] = paragraph.children.map { visit($0) }
        return Paragraph(transofrmed)
    }
    
    mutating func visitText(_ text: Markdown.Text) -> Node {
        return .text(text.string)
    }
    
    mutating func visitHeading(_ heading: Heading) -> Node {
        let content = heading.children.map { visit($0) }
        return Header(heading, content)
    }
    
    mutating func visitInlineCode(_ inlineCode: InlineCode) -> Node {
        .code("\(inlineCode.code)")
    }
    
    mutating func visitLink(_ link: Link) -> Node {
        let content = link.children.map { visit($0) }
        return Link(attributes: [.href(link.destination ?? "")], content)
    }
    
}

