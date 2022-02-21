//
//  CustomCVC.swift
//  NavigationBar-GenieMusic
//
//  Created by 양수빈 on 2022/02/15.
//

import UIKit

import SnapKit

class CustomCVC: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "CustomCVC"
    
    let titleLabel = UILabel()
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("fatalError..")
    }
    
    // MARK: - Method
    private func setUI() {
        titleLabel.text = "기본"
        titleLabel.textColor = .white
        backgroundColor = .darkGray
        layer.cornerRadius = 4
    }
    
    private func setLayout() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
        }
    }
}
