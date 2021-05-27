////
////  RoundImageView.swift
////  LifeTap
////
////  Created by Abdul Rahim on 27/05/21.
////
//
//import Foundation
//import UIKit
//
////@note:Recommended Size: CGSize(width:70,height:70)
//class RoundedView: UIView {
//    
//
//    
//    private var attributes:Attributes = Attributes()
//    let colors = Color.black
//    private let indicatorLayer: CAGradientLayer = .init()
//    /// layer between indicatorLayer and contentView
//    private let intermediateLayer: CAShapeLayer! = .init()
//    
//    private let borderWidth: CGFloat = 4
//    //private var contentView: ContentView!
//    private let rotateAnimation: CABasicAnimation = {
//        let animation = CABasicAnimation(keyPath: KeyPath.rotation)
//        animation.fromValue = 0
//        animation.toValue = 2 * Double.pi
//        animation.speed = 0.0
//        animation.repeatCount = .infinity
//        return animation
//    }()
//    
//    lazy var imageView: UIImageView = {
//        let iv = UIImageView()
//        iv.layer.borderWidth = 2.0
//        iv.layer.borderColor = attributes.borderColor.cgColor
//        iv.clipsToBounds = true
//        return iv
//    }()
//        
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        clipsToBounds = true
//        backgroundColor = attributes.backgroundColor
//        
//       
////        let center = imageView.center
////        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle:  2 * CGFloat.pi, clockwise: true)
////        intermediateLayer.path = circularPath.cgPath
////        intermediateLayer.fillColor = UIColor.clear.cgColor
////        intermediateLayer.strokeColor = UIColor.blue.cgColor
////        intermediateLayer.lineWidth = 10
////        imageView.layer.addSublayer(intermediateLayer)
//        addSubview(imageView)
//        
//    }
//    
//   
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        clipsToBounds = false
//       // backgroundColor = attributes.backgroundColor
////        imageView.layer.addSublayer(indicatorLayer)
//        //imageView.layer.addSublayer(intermediateLayer)
//        addSubview(imageView)
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        layer.cornerRadius = frame.height/2
////        indicatorLayer.frame = imageView.frame.insetBy(dx: -borderWidth, dy: -borderWidth)
////        indicatorLayer.cornerRadius = indicatorLayer.frame.width / 2.0
////        intermediateLayer.borderColor = UIColor.border.cgColor
////        intermediateLayer.borderWidth = borderWidth / 2.0
////        intermediateLayer.backgroundColor = UIColor.black.cgColor
////        intermediateLayer.frame = imageView.frame.insetBy(dx: -borderWidth / 2.0, dy: -borderWidth / 2.0)
////        intermediateLayer.cornerRadius = intermediateLayer.frame.width / 2.0
//        imageView.frame = CGRect(x:1,y:1,width:(attributes.size.width)-2,height:attributes.size.height-2)
//        imageView.layer.cornerRadius = imageView.frame.height/2
//    }
//    
//    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        //intermediateLayer.borderColor = UIColor.border.cgColor
//    }
//    
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
//           // statusView.isHidden = true
//        case .unseen:
//            update(by: .default)
//           // statusView.isHidden = false
//        case .none:
//            update(by: .clear)
//           // statusView.isHidden = true
//        }
//    }
//}
//
//extension RoundedView {
//    
//
//    
//    func enableBorder(enabled: Bool) {
//        if enabled {
//            layer.borderColor = UIColor.clear.cgColor
//            layer.borderWidth = 0
//        } else {
//            layer.borderColor = attributes.borderColor.cgColor
//            layer.borderWidth = attributes.borderWidth
//            
//        }
//    }
//    
//    /// execute circle animation
//    /// - Parameters:
//    ///  - speed: speed of rotate animation
//    ///  - alpha: alpha of contentView
//    func startAnimating(speed: Float = 0.2, alpha: CGFloat = 0.7) {
//        rotateAnimation.speed = speed
//        indicatorLayer.add(animation: rotateAnimation)
//        UIView.animate(withDuration: Parameter.duration, animations: { [weak self] in
//            self?.layer.borderColor = UIColor.clear.cgColor
//            self?.indicatorLayer.colors = self?.colors.map { $0.cgColor }
//            self?.imageView.alpha = alpha
//            self?.update(by: .seen)
//        })
//    }
//    /// stop circle animation
//    func stopAnimating() {
//        indicatorLayer.removeAllAnimations()
//        imageView.alpha = 1.0
//    }
//    
//  
//}
//
//
//extension CALayer {
//    /// function to add animation to layer without key
//    func add<A: CAAnimation>(animation: A, forKey: String? = nil) {
//        self.add(animation, forKey: forKey)
//    }
//}
//
//
//extension UIColor {
//    /// static variable of UIColor applied to darkmode
//    static var border = UIColor {
//        $0.userInterfaceStyle == .dark ? .black : .white
//    }
//}
//
//
//public enum DisplayType {
//    /// state as watched content
//    case seen
//    /// state as unwatched content
//    case unseen
//    /// state without any status
//    case none
//    
//}
