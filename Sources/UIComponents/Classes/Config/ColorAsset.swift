//
//  File.swift
//  
//
//  Created by Ali Bamohammad on 15/02/2024.
//

import UIKit
import SwiftUI

final class ColorAsset {
    private(set) var name: String

    typealias Color = UIColor

    private(set) lazy var color: Color = {
        guard let color = Color(asset: self) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }()

    func color(compatibleWith traitCollection: UITraitCollection) -> Color {
        let bundle = BundleToken.bundle
        guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }

    #if canImport(SwiftUI)
        private(set) lazy var swiftUIColor: SwiftUI.Color = .init(asset: self)
    #endif

    init(name: String) {
        self.name = name
    }
}

extension ColorAsset.Color {
    convenience init?(asset: ColorAsset) {
        let bundle = BundleToken.bundle
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
    }
}

#if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    extension SwiftUI.Color {
        init(asset: ColorAsset) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle)
        }
    }
#endif



