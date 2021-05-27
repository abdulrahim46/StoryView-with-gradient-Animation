//
//  ImageCollectionViewCell.swift
//  LifeTap
//
//  Created by Abdul Rahim on 26/05/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    private var attributes:Attributes = Attributes()
    private let gradientLayer = CAShapeLayer()
    private let greyLayer: CAShapeLayer = CAShapeLayer()
    private let whiteLayer: CAShapeLayer = CAShapeLayer()
    
    private let button: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
    }()

    let gradient = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = contentView.bounds
        button.layer.cornerRadius = frame.height / 2
    }
    
    //MARK:- setting gradient & CAShapeLayer layers for animation
    func setupGradient() {
        /// CAShape layer path setup
        let center = contentView.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 45, startAngle: 0, endAngle:  2 * CGFloat.pi, clockwise: true)
        greyLayer.path = circularPath.cgPath
        greyLayer.fillColor = UIColor.clear.cgColor
        greyLayer.strokeColor = UIColor.systemGray.cgColor
        greyLayer.lineWidth = 6
        greyLayer.strokeEnd = 1
        button.layer.addSublayer(greyLayer)
        
        /// White layer path setup
        let whiteSpace = UIBezierPath(arcCenter: center, radius: 37, startAngle: 0, endAngle:  2 * CGFloat.pi, clockwise: true)
        whiteLayer.path = whiteSpace.cgPath
        whiteLayer.fillColor = UIColor.clear.cgColor
        whiteLayer.strokeColor = UIColor.systemBackground.cgColor
        whiteLayer.lineWidth = 10
        whiteLayer.strokeEnd = 1
        button.layer.addSublayer(whiteLayer)
        
        /// gradient layer path setup
        gradientLayer.path = circularPath.cgPath
        gradientLayer.fillColor = UIColor.clear.cgColor
        gradientLayer.strokeColor = attributes.backgroundColor.cgColor
        gradientLayer.lineWidth = 6
        gradientLayer.strokeEnd = 1
        gradientLayer.lineCap = CAShapeLayerLineCap.round
        
        /// setting the gradient color
        gradient.frame = circularPath.bounds
        gradient.colors = [UIColor.magenta.cgColor, UIColor.cyan.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.mask = gradientLayer
    
        button.layer.addSublayer(gradient)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    //MARK:- setting the image here
    public func configure(with name: String) {
        let image = UIImage(named: name)
        button.setBackgroundImage(image, for: UIControl.State.normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK:- ImageView tap action
    @objc public func didTap() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.fillMode = CAMediaTimingFillMode.both
        basicAnimation.isRemovedOnCompletion = true
        gradientLayer.strokeEnd = 0
        gradientLayer.add(basicAnimation, forKey: "line")
    }
    
}

