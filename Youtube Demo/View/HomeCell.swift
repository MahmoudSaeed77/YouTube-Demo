//
//  HomeCell.swift
//  Youtube Demo
//
//  Created by Mohamed Ibrahem on 3/24/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class HomeCell: UICollectionViewCell {
    var tapped = true
    let playerView: YTPlayerView = {
        let view = YTPlayerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    let channelThumb: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor.white
        image.layer.cornerRadius = 30
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.darkGray.cgColor
        image.clipsToBounds = true
        return image
    }()
    let channelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        return label
    }()
    lazy var subscribeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(subTapped), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.setTitle("SUBSCRIBE", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.red, for: .normal)
        button.setImage(nil, for: .normal)
        button.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        var spacing: CGFloat = 5; // the amount of spacing to appear between image and title
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    fileprivate func setupView() {
        backgroundColor = UIColor.clear
        addSubview(playerView)
        addSubview(channelThumb)
        addSubview(subscribeButton)
        addSubview(channelNameLabel)
    }
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            playerView.widthAnchor.constraint(equalTo: widthAnchor),
            playerView.topAnchor.constraint(equalTo: topAnchor),
            playerView.heightAnchor.constraint(equalToConstant: 270),
            
            channelThumb.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            channelThumb.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            channelThumb.heightAnchor.constraint(equalToConstant: 60),
            channelThumb.widthAnchor.constraint(equalToConstant: 60),
            
            subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            subscribeButton.centerYAnchor.constraint(equalTo: channelThumb.centerYAnchor),
            
            channelNameLabel.leadingAnchor.constraint(equalTo: channelThumb.trailingAnchor, constant: 10),
            channelNameLabel.centerYAnchor.constraint(equalTo: channelThumb.centerYAnchor),
            ])
    }
    @objc fileprivate func subTapped() {
        if tapped {
            subscribeButton.setTitle("UNSUBSCRIBE", for: .normal)
            subscribeButton.setTitleColor(UIColor.lightGray, for: .normal)
            subscribeButton.setImage(UIImage(named: "bell")?.withRenderingMode(.alwaysOriginal), for: .normal)
            tapped = !tapped
        } else {
            subscribeButton.setTitle("SUBSCRIBE", for: .normal)
            subscribeButton.setTitleColor(UIColor.red, for: .normal)
            subscribeButton.setImage(nil, for: .normal)
            tapped = !tapped
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
