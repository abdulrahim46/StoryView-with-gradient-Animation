////
////  CustomStoryButton.swift
////  LifeTap
////
////  Created by Abdul Rahim on 27/05/21.
////
//
//
//import UIKit
//import Foundation
//
///// By conforming this delegate, tap event and long pressed event are detected
//public protocol CustomStoryButtonDelegate: class {
//    /// In this function, any action you want should be operated on tap event
//    func didTapped()
//    /// In this function, any action you want should be operated on long press event
//    func didLongPressed()
//}
//
///// custom button which looked like instagram story
//@IBDesignable open class CustomStoryButton: UIButton {
//    // MARK: - public access DataType
//    /// indicate following type of IGStoryButton
//    public enum DisplayType: Equatable {
//        /// state as watched content
//        case seen
//        /// state as unwatched content
//        case unseen
//        /// state with any status
//    //    case status(type: StatusView.DisplayType)
//        /// state without any status
//        case none
//        
//        public static func == (lhs: CustomStoryButton.DisplayType, rhs: CustomStoryButton.DisplayType) -> Bool {
//            switch (lhs, rhs) {
//            case (.seen, .seen), (.unseen, .unseen), (.none, .none):
//                return true
//            default:
//                return false
//            }
//        }
//    }
//    
//    /// color type of indicatorLayer
//    public enum ColorType: Equatable {
//        /// orange and pink
//        case `default`
//        /// black and lightgray
//        case black
//        /// clear
//        case clear
//        /// custom setting if inputting colors you want into an argument
//        case custom(colors: [UIColor])
//    }
//    
//    /// structure consisted of ColorType and DisplayType
//    public struct TypeCondition {
//        var display: DisplayType
//        var color: ColorType?
//        
//        public init(display: DisplayType, color: ColorType? = nil) {
//            self.display = display
//            self.color = color
//        }
//    }
//    
//    // MARK: - public access property
//    /// delegate to manipulate tap event and long pressed event to any target
//    public weak var delegate: CustomStoryButtonDelegate?
//    ///
//    public var image: UIImageView? {
//        didSet {
//          //  contentView.image = image
//        }
//    }
//    /// property of injecting contents from code
//    public var condition: TypeCondition = .init(display: .none) {
//        didSet {
//            update(by: condition.display)
//            update(by: condition.color)
//        }
//    }
//    /// read-only property of colorType
//    public var colorType: ColorType? {
//        condition.color
//    }
//    /// read-only property of displayType
//    public var displayType: DisplayType {
//        condition.display
//    }
//    
//    // MARK: - private access property
//    /// instance of ConentView
//   // private var contentView: ContentView!
//    /// instance of StatusView
//    //private var statusView: StatusView!
//    /// width of intermedicateLayer's border
//    private let borderWidth: CGFloat = 4
//    /// layer between indicatorLayer and contentView
//    private let intermediateLayer: CAShapeLayer! = .init()
//    /// bottom layer in this button (layer of this view stacks this layer for the first time)
//    private let indicatorLayer: CAGradientLayer = .init()
//    /// animation for indicatorLayer inherited CAGradientLayer
//    private let rotateAnimation: CABasicAnimation = {
//        let animation = CABasicAnimation(keyPath: KeyPath.rotation)
//        animation.fromValue = 0
//        animation.toValue = 2 * Double.pi
//        animation.speed = 0.0
//        animation.repeatCount = .infinity
//        return animation
//    }()
//    
//    // MARK: - Initializer and setting (configuration, layout, darkmode)
//    /**
//    - Parameters:
//     - frame: frame of this button
//     - displayType: set displayType via initializer
//     - colorType: set colorType via initializer
//     - image: set image via initializer
//     */
//    public init(frame: CGRect, displayType: DisplayType, colorType: ColorType, image: UIImage?) {
//        super.init(frame: frame)
//        configure(displayType: displayType, colorType: colorType, image: image)
//    }
//    
//    override public init(frame: CGRect) {
//        super.init(frame: frame)
//        configure()
//    }
//    
//    required public init?(coder: NSCoder) {
//        super.init(coder: coder)
//        configure()
//    }
//    
//    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        intermediateLayer.borderColor = UIColor.border.cgColor
//    }
//    
//    override public func layoutSubviews() {
//        super.layoutSubviews()
//        validate(width: frame.width, height: frame.height)
//        // arrange layout
//        configureLayout()
//    }
//    
//    private func configure(displayType: DisplayType = .none, colorType: ColorType = .default, image: UIImage? = nil) {
//        configureView()
//        configureLayer()
//        configureLayout()
//        configureRecognizer()
//        
//        image.image = image
//        layer.addSublayer(indicatorLayer)
//        layer.addSublayer(intermediateLayer)
//        addSubview(contentView)
//    
//        update(by: displayType)
//        update(by: colorType)
//    }
//}
//
//public extension CustomStoryButton {
//    func validate(width: CGFloat, height: CGFloat) {
//        precondition(width == height, "The size of width and height are required to be equal")
//    }
//}
//
//// TODO: implemented richer animation like instagram story...
//public extension CustomStoryButton {
//    /// execute circle animation
//    /// - Parameters:
//    ///  - speed: speed of rotate animation
//    ///  - alpha: alpha of contentView
//    func startAnimating(speed: Float = 0.2, alpha: CGFloat = 0.7) {
//        rotateAnimation.speed = speed
//        indicatorLayer.add(animation: rotateAnimation)
//        UIView.animate(withDuration: Parameter.duration, animations: { [weak self] in
//           self?.contentView.alpha = alpha
//        })
//    }
//    /// stop circle animation
//    func stopAnimating() {
//        indicatorLayer.removeAllAnimations()
//        contentView.alpha = 1.0
//    }
//}
//
//private extension CustomStoryButton {
//    /// subview configuration
//    func configureView() {
//       // contentView = .init(frame: CGRect(x: borderWidth / 2.0, y: borderWidth / 2.0, width: frame.width - borderWidth, height: frame.height - borderWidth))
//       // statusView = .init(frame: CGRect(x: (frame.width - borderWidth) * 3.0 / 4.0, y: (frame.width - borderWidth) * 3.0 / 4.0, width: (frame.width - borderWidth) / 3.0, height: (frame.width - borderWidth) / 3.0))
//    }
//    
//    /// layer configuration
//    func configureLayer() {
//        intermediateLayer.borderColor = UIColor.border.cgColor
//        intermediateLayer.borderWidth = borderWidth / 2.0
//        intermediateLayer.backgroundColor = UIColor.black.cgColor
//    }
//    
//    /// layout configuration
//    func configureLayout() {
//        layer.cornerRadius = layer.frame.width / 2.0
//        indicatorLayer.frame = contentView.frame.insetBy(dx: -borderWidth, dy: -borderWidth)
//        indicatorLayer.cornerRadius = indicatorLayer.frame.width / 2.0
//        intermediateLayer.frame = contentView.frame.insetBy(dx: -borderWidth / 2.0, dy: -borderWidth / 2.0)
//        intermediateLayer.cornerRadius = intermediateLayer.frame.width / 2.0
//       // statusView.frame = CGRect(x: (frame.width - borderWidth) * 3.0 / 4.0, y: (frame.width - borderWidth) * 3.0 / 4.0, width: (frame.width - borderWidth) / 3.0, height: (frame.width - borderWidth) / 3.0)
//    }
//    
//    /// gestureRecognizer configuration
//    func configureRecognizer() {
//        let tapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(didTapped))
//        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressed))
//        addGestureRecognizer(tapGestureRecognizer)
//        addGestureRecognizer(longPressGestureRecognizer)
//    }
//}
//
//private extension CustomStoryButton {
//    /// executed event when this button is tapped
//    /// - Parameters:
//    ///  - sender: gestureRecognizer attached to this button
//    @objc func didTapped(sender: UITapGestureRecognizer) {
//        delegate?.didTapped()
//    }
//    
//    /// executed event when this button is long pressed
//    @objc func didLongPressed(sender: UILongPressGestureRecognizer) {
//        delegate?.didLongPressed()
//        if sender.state == .began {
//            let originalTransform = transform
//            let scaledTransform = originalTransform.scaledBy(x: Parameter.scale, y: Parameter.scale)
//            // HACK: perform animation
//            UIView.animate(withDuration: Parameter.duration, animations: {
//                print("animation starting")
//            }) { [weak self] _ in
//                self?.transform = scaledTransform
//                UIView.animate(withDuration: Parameter.duration, animations: { [weak self] in
//                    self?.transform = .identity
//                })
//            }
//        }
//    }
//    
//    /// update colors of indicatorLayer by colorType
//    func update(by colorType: ColorType?) {
//        // if colorType is nil, do nothing
//        guard let colorType = colorType else { return }
//        switch colorType {
//        case .default:
//            let colors = Color.pink
//            indicatorLayer.colors = colors.map { $0.cgColor }
//        case .black:
//            let colors = Color.black
//            indicatorLayer.colors = colors.map { $0.cgColor }
//        case .clear:
//            let colors = Color.clear
//            indicatorLayer.colors = colors.map { $0.cgColor }
//        case .custom(let colors):
//            indicatorLayer.colors = colors.map { $0.cgColor }
//        }
//    }
//    
//    /// update state of this button by displayType
//    func update(by displayType: DisplayType) {
//        switch displayType {
//        case .seen:
//            update(by: .black)
//            //statusView.isHidden = true
//        case .unseen:
//            update(by: .default)
//            //statusView.isHidden = true
//        case .none:
//            update(by: .clear)
//           // statusView.isHidden = true
//        }
//    }
//}
