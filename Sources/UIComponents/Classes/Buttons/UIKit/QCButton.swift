

import UIKit

public struct QCButtonConfig {
    public var background: UIColor
    public var titleColor: UIColor
    public var tintColor: UIColor
    public var disabledBackground: UIColor
    public var disabledTitleColor: UIColor
    public var font: UIFont
    public var radius: CGFloat
    public var size: ButtonSize
    public var iconSize: CGFloat
}

public extension QCButtonConfig {
    static var primary: Self {
        return .init(
            background: UIComponentConfig.currentTheme.background.primaryCTA,
            titleColor: UIComponentConfig.currentTheme.content.onColor,
            tintColor: UIComponentConfig.currentTheme.content.onColor,
            disabledBackground: UIComponentConfig.currentTheme.background.disable,
            disabledTitleColor: UIComponentConfig.currentTheme.content.onColor,
            font: UIComponentConfig.currentTheme.font.bold.withSize(12),
            radius: 8,
            size: .medium,
            iconSize: 20
        )
    }
}

@IBDesignable
public class QCButton: UIButton {
    private lazy var leftIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var rightIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    /// @IBInspectable leftIcon properties for storyboard
    /// use this if you want to have image in left side
    /// use default setImage function if you want to have button with only image
    @IBInspectable public var leftIcon: UIImage? {
        didSet {
            setLeftIcon(leftIcon, for: .normal)
        }
    }

    /// @IBInspectable rightIcon properties for storyboard
    /// use this if you want to have image in right side
    /// use default setImage function if you want to have button with only image
    @IBInspectable public var rightIcon: UIImage? {
        didSet {
            setRightIcon(rightIcon, for: .normal)
        }
    }
    
    /// @IBInspectable height properties for storyboard
    /// use this if you want to override height from button size in config
    @IBInspectable public var height: CGFloat = 0.0 {
        didSet {
            if height > 0 {
                heightConstraint?.constant = height
            } else {
                heightConstraint?.constant = config.size.rawValue
            }
        }
    }

    /// default config is primary you can change properties as you want
    public var config: QCButtonConfig = .primary {
        didSet {
            commonInit()
        }
    }
    

    private var leftIcons: [UInt: UIImage] = [:]
    private var rightIcons: [UInt: UIImage] = [:]

    override public var isHighlighted: Bool {
        didSet {
            updateProperties()
        }
    }

    override public var isSelected: Bool {
        didSet {
            updateProperties()
        }
    }

    override public var isEnabled: Bool {
        didSet {
            updateProperties()
        }
    }

    /// Initialization and common setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        addSubview(leftIconView)
        addSubview(rightIconView)
        NSLayoutConstraint.activate([leftIconView.heightAnchor.constraint(equalToConstant: config.iconSize),
                                     leftIconView.widthAnchor.constraint(equalToConstant: config.iconSize),
                                     leftIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     leftIconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: config.size.pading),

                                     rightIconView.heightAnchor.constraint(equalToConstant: config.iconSize),
                                     rightIconView.widthAnchor.constraint(equalToConstant: config.iconSize),
                                     rightIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     rightIconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -config.size.pading)])

        leftIconView.contentMode = .scaleAspectFit
        rightIconView.contentMode = .scaleAspectFit
        cornerRadius = config.radius
        tintColor = config.tintColor
        // to override  storyboard constraint value
        heightConstraint?.constant = height > 0 ? height : config.size.rawValue
        updateProperties()
    }

    private func updateProperties() {
        let rightImage = rightIcons[state.rawValue] ?? rightIcons[UIControl.State.normal.rawValue]
        let leftImage = leftIcons[state.rawValue] ?? leftIcons[UIControl.State.normal.rawValue]
        rightIconView.image = rightImage
        leftIconView.image = leftImage

        backgroundColor = isEnabled ? config.background : config.disabledBackground
        setTitleColor(config.titleColor, for: .normal)
        setTitleColor(config.disabledTitleColor, for: .disabled)

        titleLabel?.font = config.font
        updateContentEdgeInsets()
    }

    public func setLeftIcon(_ image: UIImage?, for state: UIControl.State) {
        leftIcons[state.rawValue] = image
        // Update the left icon if the current state matches
        if state == self.state {
            updateLeftIconForCurrentState()
        }
    }

    public func setRightIcon(_ image: UIImage?, for state: UIControl.State) {
        rightIcons[state.rawValue] = image
        // Update the right icon if the current state matches
        if state == self.state {
            updateRightIconForCurrentState()
        }
    }

    private func updateRightIconForCurrentState() {
        let image = rightIcons[state.rawValue] ?? rightIcons[UIControl.State.normal.rawValue]
        rightIconView.image = image
        updateContentEdgeInsets()
    }

    private func updateLeftIconForCurrentState() {
        let image = rightIcons[state.rawValue] ?? rightIcons[UIControl.State.normal.rawValue]
        leftIconView.image = image
        updateContentEdgeInsets()
    }

    private func updateContentEdgeInsets() {
        // add horizontal space if there is images
        if UIComponentConfig.isRTLLanguage {
            contentEdgeInsets.right = leftIconView.image != nil ? (config.size.pading + config.iconSize + config.size.iconMargin) : config.size.pading
            contentEdgeInsets.left = rightIconView.image != nil ? (config.size.pading + config.iconSize + config.size.iconMargin) : config.size.pading
        } else {
            contentEdgeInsets.left = leftIconView.image != nil ? (config.size.pading + config.iconSize + config.size.iconMargin) : config.size.pading
            contentEdgeInsets.right = rightIconView.image != nil ? (config.size.pading + config.iconSize + config.size.iconMargin) : config.size.pading
        }
    }
}

extension UIView {
    var heightConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
}

public enum ButtonSize: CGFloat {
    case small = 36
    case medium = 40
    case large = 42
    case xLarge = 46
    case doubleXLarge = 58

    var pading: CGFloat {
        switch self {
        case .small:
            return 14
        case .medium:
            return 16
        case .large:
            return 18
        case .xLarge:
            return 20
        case .doubleXLarge:
            return 28
        }
    }

    var iconMargin: CGFloat {
        switch self {
        case .doubleXLarge:
            return 12
        default:
            return 8
        }
    }
}
