//
//  File.swift
//
//
//  Created by Ali Bamohammad on 06/02/2024.
//

import UIKit

public class UIComponentConfig {
    static let shared = UIComponentConfig()
    static var background = Background()
    static var border = Border()
    static var content = Content()
    static var font = Font()
    static var isRTLLanguage = true
    
    public struct Background {
        public var primary: UIColor = .white
        public var primaryCTA: UIColor = .black
        public var disable: UIColor = .lightGray
        public var lightNegative: UIColor = .red.withAlphaComponent(0.5)
        public var lightPositive: UIColor = .green.withAlphaComponent(0.5)
        public var lightWarning: UIColor = .yellow.withAlphaComponent(0.5)
        public var loader: UIColor = .lightGray.withAlphaComponent(0.5)
        public var negative: UIColor = .red
        public var secondary: UIColor = UIColor(red: 0.969, green: 0.973, blue: 0.98, alpha: 1)
        public var secondaryCTA: UIColor = UIColor(red: 113/255, green: 157/255, blue: 198/255, alpha: 1)
        public var selected: UIColor = UIColor(red: 113/255, green: 157/255, blue: 198/255, alpha: 1)
        public var tertiary: UIColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        public var warning: UIColor = UIColor(red: 255/255, green: 245/255, blue: 232/255, alpha: 1)
    }

    public struct Border {
        public var primary: UIColor = UIColor(red: 240/255, green: 240/255, blue: 242/255, alpha: 1)
        public var secondary: UIColor = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1)
        public var tertiary: UIColor = UIColor(red: 209/255, green: 209/255, blue: 214/255, alpha: 1)
        public var negative: UIColor = .red
        public var positive: UIColor = .green
        public var selected: UIColor = UIColor(red: 113/255, green: 157/255, blue: 198/255, alpha: 1)
        public var warning: UIColor? = UIColor(red: 255/255, green: 228/255, blue: 191/255, alpha: 1)
    }

    public struct Content {
        public var primary: UIColor = .black
        public var secondary: UIColor = .gray
        public var tertiary: UIColor? = .lightGray
        public var actionPrimary: UIColor = .black
        public var actionSecondary2: UIColor = UIColor(red: 113/255, green: 157/255, blue: 198/255, alpha: 1)
        public var actionSecondary: UIColor = UIColor(red: 113/255, green: 157/255, blue: 198/255, alpha: 1)
        public var actionTertiary2: UIColor = UIColor(red: 113/255, green: 157/255, blue: 198/255, alpha: 1)
        public var actionTertiary: UIColor? = UIColor(red: 82/255, green: 80/255, blue: 78/255, alpha: 1)
        public var negative: UIColor = .red
        public var onColor: UIColor = .white
        public var positive: UIColor = .green
        public var warning: UIColor = UIColor(red: 255/255, green: 228/255, blue: 191/255, alpha: 1)
    }

    public struct Font {
        public var bold: UIFont = .systemFont(ofSize: 12, weight: .bold)
        public var medium: UIFont = .systemFont(ofSize: 12, weight: .medium)
        public var regular: UIFont = .systemFont(ofSize: 12, weight: .regular)
        public var heavy: UIFont = .systemFont(ofSize: 12, weight: .heavy)
    }

    private init() {} // Private initializer to ensure singleton usage
}
