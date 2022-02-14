//
//  DetailVC.swift
//  NavigationBar-GenieMusic
//
//  Created by 양수빈 on 2022/02/14.
//

import UIKit

class DetailVC: UIViewController {
    
    // MARK: - Properties
    
    private let nameLabel = UILabel()
    private let beforeButton = UIButton()
    
    // TODO: - 스크롤시 타이틀 생기도록
    lazy var navigationBar = NavigationBar(self, title: "")
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setAddTarget()
    }
    
    // MARK: - Method
    
    private func setUI() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        view.backgroundColor = .white
        nameLabel.text = "DetailVC🥩"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 24)
        
        beforeButton.setTitle("이전 뷰로", for: .normal)
        beforeButton.setTitleColor(.red, for: .normal)
    }
    
    private func setLayout() {
        view.addSubview(navigationBar)
        view.addSubview(nameLabel)
        view.addSubview(beforeButton)
        
        navigationBar.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        beforeButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        beforeButton.addTarget(self, action: #selector(goToPreVC), for: .touchUpInside)
    }
    
    // MARK: - @objc
    @objc
    func goToPreVC() {
        navigationController?.popViewController(animated: true)
    }

}
