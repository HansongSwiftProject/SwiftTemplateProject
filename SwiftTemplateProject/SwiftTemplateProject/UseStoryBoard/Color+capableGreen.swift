//
//  Color+capableGreen.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/10/20.
//

#if os(iOS)

    import UIKit
    typealias TypeColor = UIColor

#elseif os(OSX)

    import AppKit
    typealias TypeColor = NSColor

#endif

extension TypeColor {
    static var capableGreen: TypeColor {
        return TypeColor(red: 137 / 255.0, green: 176 / 255.0, blue: 106 / 255.0, alpha: 1.0)
    }

    static var capableRed: TypeColor {
        return TypeColor(red: 1.0, green: 120 / 255.0, blue: 120 / 255.0, alpha: 1.0)
    }
}
