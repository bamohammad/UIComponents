//
//  File.swift
//
//
//  Created by Ali Bamohammad on 15/02/2024.
//

import UIKit

public protocol Theme {
    var background: Background { get }
    var border: Border { get }
    var content: Content { get }
    var font: Font { get }
}

struct DefaultTheme: Theme {
    var background = Background(
        primary: Colors.Background.primary.color,
        primaryCTA: Colors.Background.primaryCTA.color,
        disable: Colors.Background.disable.color,
        lightNegative: Colors.Background.lightNegative.color,
        lightPositive: Colors.Background.lightPositive.color,
        lightWarning: Colors.Background.lightWarning.color,
        loader: Colors.Background.loader.color,
        negative: Colors.Background.negative.color,
        secondary: Colors.Background.secondary.color,
        secondaryCTA: Colors.Background.secondaryCTA.color,
        selected: Colors.Background.selected.color,
        tertiary: Colors.Background.tertiary.color,
        warning: Colors.Background.warning.color
    )
    var border = Border(
        primary: Colors.Border.primary.color,
        secondary: Colors.Border.secondary.color,
        tertiary: Colors.Border.tertiary.color,
        negative: Colors.Border.negative.color,
        positive: Colors.Border.positive.color,
        selected: Colors.Border.selected.color,
        warning: Colors.Border.warning.color
    )
    var content = Content(
        primary: Colors.Content.primary.color,
        secondary: Colors.Content.secondary.color,
        tertiary: Colors.Content.tertiary.color,
        actionPrimary: Colors.Content.actionPrimary.color,
        actionSecondary2: Colors.Content.actionSecondary2.color,
        actionSecondary: Colors.Content.actionSecondary.color,
        actionTertiary2: Colors.Content.actionTertiary2.color,
        actionTertiary: Colors.Content.actionTertiary.color,
        negative: Colors.Content.negative.color,
        onColor: Colors.Content.onColor.color,
        positive: Colors.Content.positive.color,
        warning: Colors.Content.warning.color
    )
    var font = Font()
}

public struct Background {
    let primary: UIColor
    let primaryCTA: UIColor
    let disable: UIColor
    let lightNegative: UIColor
    let lightPositive: UIColor
    let lightWarning: UIColor
    let loader: UIColor
    let negative: UIColor
    let secondary: UIColor
    let secondaryCTA: UIColor
    let selected: UIColor
    let tertiary: UIColor
    let warning: UIColor
}

public struct Border {
    let primary: UIColor
    let secondary: UIColor
    let tertiary: UIColor
    let negative: UIColor
    let positive: UIColor
    let selected: UIColor
    let warning: UIColor
}

public struct Content {
    let primary: UIColor
    let secondary: UIColor
    let tertiary: UIColor
    let actionPrimary: UIColor
    let actionSecondary2: UIColor
    let actionSecondary: UIColor
    let actionTertiary2: UIColor
    let actionTertiary: UIColor
    let negative: UIColor
    let onColor: UIColor
    let positive: UIColor
    let warning: UIColor
}

public struct Font {
    let bold: UIFont = .systemFont(ofSize: 12, weight: .bold)
    let medium: UIFont = .systemFont(ofSize: 12, weight: .medium)
    let regular: UIFont = .systemFont(ofSize: 12, weight: .regular)
    let heavy: UIFont = .systemFont(ofSize: 12, weight: .heavy)
}
