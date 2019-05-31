//
//  HeaderView.swift
//  Stretcthy Header Collection View
//
//  Created by Faridho Luedfi on 01/05/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imgView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "dummy-img"))
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        addSubview(imgView)
        imgView.fillSuperview()
        imgView.contentMode = .scaleAspectFill
        
        // blur
        setupVisualEffectBlur()
        
        // Gradient Layer
        setupGradientLayer()
        
    }
    
    fileprivate func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.6, 1]
        
        //layer.addSublayer(gradientLayer) //must be but ..
        
        let gradientContentView = UIView()
        addSubview(gradientContentView)
        gradientContentView.setAnchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContentView.layer.addSublayer(gradientLayer)
        gradientLayer.frame = bounds
        gradientLayer.frame.origin.y -= bounds.height
        
        let headerLabel = UILabel()
        headerLabel.text = "Stratchy Header Component"
        headerLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        headerLabel.textColor = .white
        
        let descLabel = UILabel()
        descLabel.text = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration."
        descLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descLabel.textColor = .white
        descLabel.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [headerLabel, descLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        
        addSubview(stackView)
        stackView.setAnchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
        
        
        
    }
    
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectBlur() {
        
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: {
        
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
            
        })
        
        animator.fractionComplete = 0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



