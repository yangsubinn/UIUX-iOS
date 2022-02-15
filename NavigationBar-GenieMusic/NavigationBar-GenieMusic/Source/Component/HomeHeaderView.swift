//
//  HomeHeaderView.swift
//  NavigationBar-GenieMusic
//
//  Created by 양수빈 on 2022/02/15.
//

import UIKit

import SnapKit

class HomeHeaderView: UIView {
    
    // MARK: - Properties
    
    private let logoImageView = UIImageView()
    private let ticketButton = UIButton()
    private let profileButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method
    
    private func setUI() {
        logoImageView.image = UIImage(named: "genie_logo")
        ticketButton.setImage(UIImage(named: "ticket"), for: .normal)
        profileButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        profileButton.tintColor = .black
    }
    
    private func setLayout() {
        self.addSubview(logoImageView)
        self.addSubview(ticketButton)
        self.addSubview(profileButton)
        
        logoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(48)
        }
        
        profileButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(48)
        }
        
        ticketButton.snp.makeConstraints { make in
            make.trailing.equalTo(profileButton.snp.leading).offset(-6)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(48)
        }
    }
}
