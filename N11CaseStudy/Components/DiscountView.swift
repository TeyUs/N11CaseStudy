//
//  DiscountView.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import UIKit

class DiscountView: UIView {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .lightBlue
        return temp
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis  = NSLayoutConstraint.Axis.vertical
        temp.distribution  = UIStackView.Distribution.fillEqually
        temp.alignment = UIStackView.Alignment.leading
        temp.spacing = 0
        temp.addArrangedSubview(normalPriceLabel)
        temp.addArrangedSubview(discountedPriceLabel)
        temp.backgroundColor = .clear
        return temp
    }()
    
    private lazy var normalPriceLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .center
        temp.text = ""
        return temp
    }()
    
    private lazy var discountedPriceLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .center
        temp.text = ""
        return temp
    }()
    
    private lazy var ratioContainerView: PentagonView = {
        let temp = PentagonView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .clear
        return temp
    }()
    
    private lazy var discountRatioPrice: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .center
        temp.text = ""
        return temp
    }()
    
    
    private var isDiscountExist = true
    private var size: DiscountViewSize = .small
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(ratioContainerView)
        ratioContainerView.addSubview(discountRatioPrice)
        containerView.addSubview(labelsStackView)
        let const:Double = 5
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
            ratioContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: const),
            ratioContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -const),
            ratioContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: const),
            ratioContainerView.widthAnchor.constraint(equalTo: ratioContainerView.heightAnchor, multiplier: 1.25),
            
            discountRatioPrice.centerXAnchor.constraint(equalTo: ratioContainerView.centerXAnchor),
            discountRatioPrice.centerYAnchor.constraint(equalTo: ratioContainerView.centerYAnchor),
        
            labelsStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: const),
            labelsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -const),
            labelsStackView.leadingAnchor.constraint(equalTo: ratioContainerView.trailingAnchor, constant: const),
            labelsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -const)
        ])
    }
    
    func configure(normal: Double, discounted: Double, size: DiscountViewSize = .small) {
        self.size = size
        if normal > discounted, discounted != 0 {
            let attributedText = NSAttributedString(
                string: "\(normal)".tl,
                attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
            )
            normalPriceLabel.attributedText = attributedText
            discountedPriceLabel.text = "\(discounted)".tl
            
            let ratio = Double(normal) / Double(discounted) - 1
            discountRatioPrice.text = ("%\(String(format: "%.0f", ratio * 100))")
            
            normalPriceLabel.font = UIFont.systemFont(ofSize: size.normalSize)
            discountedPriceLabel.font = UIFont.systemFont(ofSize: size.discountSize)
            discountRatioPrice.font = UIFont.systemFont(ofSize: size.normalSize)
        } else {
            isDiscountExist = false
            discountedPriceLabel.isHidden = true
            ratioContainerView.isHidden = true
            if normal > 0 {
                normalPriceLabel.text = "\(normal)".tl
            } else {
                normalPriceLabel.text = "\(discounted)".tl
            }
        }
    }

    enum DiscountViewSize {
        case large
        case small
        
        var discountSize: CGFloat {
            switch self {
            case .large:
                25
            case .small:
                15
            }
        }
        var normalSize: CGFloat {
            switch self {
            case .large:
                15
            case .small:
                10
            }
        }
    }
    
    class PentagonView : UIView {

        override init(frame: CGRect) {
            super.init(frame: frame)
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        override func draw(_ rect: CGRect) {
            
            let box = rect.size
            let triangleRatio:Double = 4/5
            
            guard let context = UIGraphicsGetCurrentContext() else { return }

            context.beginPath()
            context.move(to: CGPoint(x: box.width * triangleRatio , y: 0))
            context.addLine(to: CGPoint(x: box.width, y: box.height / 2))
            context.addLine(to: CGPoint(x:box.width * triangleRatio, y: box.height))
            context.addLine(to: CGPoint(x: 0, y: box.height))
            context.addLine(to: CGPoint(x: 0, y: 0))
            context.addLine(to: CGPoint(x:box.width * triangleRatio, y: 0))
            context.closePath()

            context.setFillColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.60)
            context.setFillColor(UIColor.systemRed.cgColor)
            context.fillPath()
        }
    }
}
