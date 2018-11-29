//
//  KISnackBar.swift
//  KISnackBar
//
//  Created by Emre Cakirlar on 29.08.18.
//  Copyright © 2018 KI labs. All rights reserved.
//

import UIKit

public final class KISnackBar: UIView {
    
    public static let shared = KISnackBar()
    
    public enum Duration {
        case short, long, indefinite
        
        var interval: TimeInterval {
            switch self {
            case .short:
                return 2
            case .long:
                return 3.5
            case .indefinite:
                return .infinity
            }
        }
    }
    
    public static let buttonTitleColor: UIColor = UIColor(red: 0.0, green: 172.0/255.0, blue: 238.0/255, alpha: 1)
    public static let bgColor: UIColor = UIColor(red: 21.0 / 255.0, green: 42.0 / 255.0, blue: 58.0 / 255.0, alpha: 1.0)
    
    private let infoFontName = "HelveticaNeue"
    private let buttonTitleFontName = "HelveticaNeue-Bold"
    
    private lazy var infoLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.font = UIFont(name: self.infoFontName, size: 13)
        $0.numberOfLines = 3
        self.containerView.addSubview($0)
        return $0
    }(UILabel(frame: .zero))
    
    private lazy var button: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.textColor = KISnackBar.buttonTitleColor
        $0.titleLabel?.textAlignment = .right
        $0.titleLabel?.font = UIFont(name: self.buttonTitleFontName, size: 14)
        $0.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        self.containerView.addSubview($0)
        return $0
    }(UIButton(type: .system))
    
    private lazy var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = KISnackBar.buttonTitleColor
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.12
        $0.layer.shadowOffset = CGSize(width: 0, height: -2)
        $0.layer.shadowRadius = 1.5
        self.addSubview($0)
        return $0
    }(UIView(frame: .zero))
    
    private var containerBottomAnchor: NSLayoutConstraint!
    private var didTapButtonAction: () -> Void = { }
    
    private init() {
        super.init(frame: .zero)
        guard let currentWindow = UIApplication.shared.keyWindow else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        currentWindow.addSubview(self)
        
        var heightConstant: CGFloat = 56
        if #available(iOS 11.0, *) {
            let bottomPadding = currentWindow.safeAreaInsets.bottom
            heightConstant += bottomPadding
        }
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: currentWindow.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: currentWindow.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: currentWindow.bottomAnchor),
            self.heightAnchor.constraint(equalToConstant: heightConstant)
            ])
        
        self.backgroundColor = .clear
        self.isHidden = true
        self.setupConstraints()

    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        self.containerBottomAnchor = self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 100)
        NSLayoutConstraint.activate([
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.containerView.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.containerBottomAnchor
            ])
        
        NSLayoutConstraint.activate([
            self.infoLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16),
            self.infoLabel.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.button.leadingAnchor, constant: -20)
            ])
        
        NSLayoutConstraint.activate([
            self.button.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -18),
            self.button.widthAnchor.constraint(greaterThanOrEqualToConstant: 59),
            self.button.centerYAnchor.constraint(equalTo: self.infoLabel.centerYAnchor),
            self.button.heightAnchor.constraint(equalTo: self.containerView.heightAnchor)
            ])
    }
    
    public func show(backgroundColor: UIColor = KISnackBar.bgColor, title: String, titleColor: UIColor = .white,
              buttonTitle: String? = "", buttonTitleColor: UIColor = KISnackBar.buttonTitleColor,
              duration: Duration = .long, _ action: (@escaping () -> Void) = {}) {
        self.isHidden = false
        self.containerView.backgroundColor = backgroundColor
        self.infoLabel.text = title
        self.infoLabel.textColor = titleColor
        self.button.setTitleColor(buttonTitleColor, for: .normal)
        self.button.setTitle(buttonTitle, for: .normal)
        self.didTapButtonAction = action
        
        // Delay of UIView.animate blocks the main thread, this is the workaround for the delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.containerBottomAnchor.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .curveEaseOut], animations: {
                self?.layoutIfNeeded()
            }, completion: { _ in
                guard duration != .indefinite else {
                    return
                }
                self?.hide(duration)
            })
        }
    }
    
    private func hide(_ duration: Duration) {
        // Delay of UIView.animate blocks the main thread, this is the workaround for the delay
        DispatchQueue.main.asyncAfter(deadline: .now() + duration.interval) { [weak self] in
            self?.containerBottomAnchor.constant = 100
            UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
                self?.layoutIfNeeded()
            }, completion: { _ in
                self?.isHidden = true
            })
        }
    }
    
    public func forceHide() {
        self.hide(.short)
    }
    
    @objc private func didTapButton() {
        self.didTapButtonAction()
    }
    
}
