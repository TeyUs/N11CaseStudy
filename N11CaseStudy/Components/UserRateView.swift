//
//  UserRateView.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 23.07.2024.
//

import UIKit

class UserRateView: UIView {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .clear
        return temp
    }()
    
    private lazy var starsStackView: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis  = NSLayoutConstraint.Axis.horizontal
        temp.distribution  = UIStackView.Distribution.fillEqually
        temp.alignment = UIStackView.Alignment.center
        temp.spacing = -2
        temp.backgroundColor = .clear
        return temp
    }()
    
    private lazy var ratioLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .center
        temp.text = ""
        return temp
    }()
    
    var starArray = [UIImage?]()
    
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
        containerView.addSubview(starsStackView)
        containerView.addSubview(ratioLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
        
            ratioLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            ratioLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            ratioLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        
            starsStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            starsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            starsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            starsStackView.trailingAnchor.constraint(equalTo: ratioLabel.leadingAnchor, constant: -5)
        ])
    }
    
    func configure(rate: Double, textSize: UserRateViewTextSize = .small) {
        starArray.removeAll()
        starsStackView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        guard rate != 0 else {
            starsStackView.isHidden = true
            ratioLabel.isHidden = true
            return
        }
    
        starsStackView.isHidden = false
        ratioLabel.isHidden = false
        
        ratioLabel.text = "\(rate)"
        ratioLabel.font = UIFont.systemFont(ofSize: textSize.normalSize)
        let filled = Int(rate)
        
        starArray.append(contentsOf: repeatElement(Star.filled.image, count: filled))
        if filled < 5 {
            
            let floating = rate - Double(filled)
            
            if floating < 0.25 {
                starArray.append(Star.empty.image)
            } else if floating < 0.75 {
                starArray.append(Star.semiFilled.image)
            } else {
                starArray.append(Star.filled.image)
            }
            let remain = 5 - starArray.count
            //
            starArray.append(contentsOf: repeatElement(Star.empty.image, count: remain))
        }
        starArray.forEach { image in
            starsStackView.addArrangedSubview(UIImageView.init(image: image))
        }
    }
    
    enum Star {
        case filled
        case semiFilled
        case empty
        
        var image: UIImage? {
            switch self {
            case .filled:
                UIImage(systemName: "star.fill")?.withTintColor(.starYellow, renderingMode: .alwaysOriginal)
            case .semiFilled:
                UIImage(systemName: "star.leadinghalf.filled")?.withTintColor(.starYellow, renderingMode: .alwaysOriginal)
            case .empty:
                UIImage(systemName: "star")?.withTintColor(.starYellow, renderingMode: .alwaysOriginal)
            }
        }
    }

    enum UserRateViewTextSize {
        case large
        case small
        
        var normalSize: CGFloat {
            switch self {
            case .large:
                15
            case .small:
                10
            }
        }
    }
}
