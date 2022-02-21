//
//  CustomHeaderView.swift
//  NavigationBar-GenieMusic
//
//  Created by 양수빈 on 2022/02/21.
//

import UIKit

class CustomHeaderView: UICollectionViewCell {
    static let identifier = "CustomHeaderView"
    
    // MARK: - Properties
    let titleLabel = UILabel()
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("FatalError")
    }
    
    private func setUI() {
        backgroundColor = .orange
    }
    
    private func setLayout() {
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
