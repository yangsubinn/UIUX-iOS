//
//  NavigationBar.swift
//  NavigationBar-GenieMusic
//
//  Created by 양수빈 on 2022/02/14.
//

import UIKit

import SnapKit

class NavigationBar: UIView {
    
    // MARK: - Properties
    private let backButton = UIButton()
    private let titleLabel = UILabel()
    private let profileButton = UIButton()
    
    private var vc: UIViewController?
    
    // MARK: - Life Cycles
    
    init(_ vc: UIViewController, title: String) {
        super.init(frame: .zero)
        self.vc = vc
        setUI(title: title)
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method
    private func setLayout() {
        self.addSubview(titleLabel)
        self.addSubview(backButton)
        self.addSubview(profileButton)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(48)
        }
        
        profileButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(48)
        }
    }
    
    private func setUI(title: String) {
        self.backgroundColor = .clear
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        
        profileButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        profileButton.tintColor = .black
    }
    
    func setNaviTitle(_ title: String) {
        titleLabel.text = title
    }
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
    }
    
    // MARK: - @objc
    
    @objc
    func goToBack() {
        vc?.navigationController?.popViewController(animated: true)
    }
}
