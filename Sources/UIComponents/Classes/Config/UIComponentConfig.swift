//
//  File.swift
//
//
//  Created by Ali Bamohammad on 06/02/2024.
//

import SwiftUI
import UIKit

public class UIComponentConfig {
    public static let shared = UIComponentConfig()
    public static var currentTheme: Theme = DefaultTheme() // Start with a default theme
    public static var isRTLLanguage = true
    public static func applyTheme(_ theme: Theme) {
        currentTheme = theme
    }
    private init() {} // Private initializer to ensure singleton usage
}
