

import UIKit

public struct QCButtonConfig {
    public var background: UIColor
    public var titleColor: UIColor
    public var tintColor: UIColor
    public var disabledBackground: UIColor
    public var disabledTitleColor: UIColor
    public var font: UIFont
    public var radius: CGFloat
    public var iconSize: CGFloat
    public var padding: CGFloat
}

public extension QCButtonConfig {
    static var primary: Self {
        return .init(
            background: .black,
            titleColor: .white,
            tintColor: .white,
            disabledBackground: .gray,
            disabledTitleColor: .white,
            font: UIFont.systemFont(ofSize: 12, weight: .bold),
            radius: 8,
            iconSize: 20,
            padding:14
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
    @IBInspectable public var leftIcon: UIImage? {
        didSet {
            setLeftIcon(leftIcon, for: .normal)
        }
    }
    /// @IBInspectable rightIcon properties for storyboard
    @IBInspectable public var rightIcon: UIImage? {
        didSet {
            setRightIcon(rightIcon, for: .normal)
        }
    }

    var config: QCButtonConfig = .primary

    private var leftIcons: [UInt: UIImage] = [:]
    private var rightIcons: [UInt: UIImage] = [:]

    public override var isHighlighted: Bool {
        didSet {
            updateProperties()
        }
    }

    public override var isSelected: Bool {
        didSet {
            updateProperties()
        }
    }

    public override var isEnabled: Bool {
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
    
    /// You might keep the override to prevent direct usage, or remove it if not needed
    public override func setImage(_ image: UIImage?, for state: UIControl.State) {
        setLeftIcon(image, for: state)
    }

    private func commonInit() {
        addSubview(leftIconView)
        addSubview(rightIconView)

        NSLayoutConstraint.activate([leftIconView.heightAnchor.constraint(equalToConstant: config.iconSize),
                                     leftIconView.widthAnchor.constraint(equalToConstant: config.iconSize),
                                     leftIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     leftIconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: config.padding),

                                     rightIconView.heightAnchor.constraint(equalToConstant: config.iconSize),
                                     rightIconView.widthAnchor.constraint(equalToConstant: config.iconSize),
                                     rightIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     rightIconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -config.padding)])

        leftIconView.contentMode = .scaleAspectFit
        rightIconView.contentMode = .scaleAspectFit
        cornerRadius = config.radius
        tintColor = config.tintColor
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
        // Update the right icon if the current state matches
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
        contentEdgeInsets.left = leftIconView.image != nil ? (config.padding + config.iconSize + 8) : config.padding
        contentEdgeInsets.right = rightIconView.image != nil ? (config.padding + config.iconSize + 8) : config.padding
    }

    
}
