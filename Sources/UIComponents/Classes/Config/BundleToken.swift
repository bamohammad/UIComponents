//
//  File.swift
//  
//
//  Created by Ali Bamohammad on 15/02/2024.
//

import Foundation

// swiftlint:disable convenience_type
final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
