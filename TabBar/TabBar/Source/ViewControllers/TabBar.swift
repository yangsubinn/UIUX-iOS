//
//  TabBar.swift
//  TabBar
//
//  Created by 양수빈 on 2022/04/11.
//

import UIKit

import SnapKit

class TabBar: UIViewController {
    
    // MARK: - Properties
    
    var selectedIndex: Int = 1
    var previousIndex: Int = 1
    var footerHeight: CGFloat = 50
    
    var viewControllers = [UIViewController]()
    var buttons = [UIButton]()
    
    let tabView = UIView()
    let feedButton = UIButton()
    let homeButton = UIButton()
    let moreButton = UIButton()
    
    static let feedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeedVC")
    static let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
    static let moreVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoreVC")

    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
        setLayout()
        setAddTarget()
    }
    
    // MARK: - Custom Methods
    private func setTabBar() {
        tabView.backgroundColor = .white
        feedButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        feedButton.setImage(UIImage(systemName: "heart"), for: .normal)
        homeButton.setImage(UIImage(systemName: "house.fill"), for: .selected)
        homeButton.setImage(UIImage(systemName: "house"), for: .normal)
        moreButton.setImage(UIImage(systemName: "ellipsis.bubble.fill"), for: .selected)
        moreButton.setImage(UIImage(systemName: "ellipsis.bubble"), for: .normal)
        
        feedButton.tintColor = .black
        homeButton.tintColor = .black
        moreButton.tintColor = .black
        
        viewControllers.append(TabBar.feedVC)
        viewControllers.append(TabBar.homeVC)
        viewControllers.append(TabBar.moreVC)
        
        buttons.append(feedButton)
        buttons.append(homeButton)
        buttons.append(moreButton)
        
        feedButton.tag = 0
        homeButton.tag = 1
        moreButton.tag = 2
        
        buttons[selectedIndex].isSelected = true
        tabChanged(sender: buttons[selectedIndex])
    }
    
    private func setAddTarget() {
        feedButton.addTarget(self, action: #selector(tabChanged(sender:)), for: .touchUpInside)
        homeButton.addTarget(self, action: #selector(tabChanged(sender:)), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(tabChanged(sender:)), for: .touchUpInside)
    }
    
    /// UIView로 구성한 탭바 아래로 숨기기
    func hideHeader() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            let frame = CGAffineTransform(translationX: 0, y: self.tabView.frame.height)
            self.tabView.transform = frame
        })
    }
    
    /// UIView로 구성한 탭바 위로 보이기
    func showHeader() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            let frame = CGAffineTransform(translationX: 0, y: 0)
            self.tabView.transform = frame
        })
    }
    
    // MARK: - @objc
    
    @objc
    func tabChanged(sender: UIButton) {
        // 탭바의 버튼을 눌렀을 때 precious에는 이전 인덱스, selected에는 현재 탭한 tag 인덱스
        previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        buttons.forEach { $0.isSelected = false }
        sender.isSelected = true
        
        let vc = viewControllers[selectedIndex]
        vc.view.frame = UIApplication.shared.windows[0].frame
        vc.didMove(toParent: self)
        self.addChild(vc)
        self.view.addSubview(vc.view)
        
        self.view.bringSubviewToFront(tabView)
    }
}

// MARK: - Layout

extension TabBar {
    private func setLayout() {
        view.addSubview(tabView)
        
        tabView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
        
        tabView.addSubview(homeButton)
        tabView.addSubview(feedButton)
        tabView.addSubview(moreButton)
        
        homeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(20)
            make.width.height.equalTo(54)
        }
        
        feedButton.snp.makeConstraints { make in
            make.trailing.equalTo(homeButton.snp.leading).offset(-54)
            make.centerY.equalTo(homeButton)
            make.width.height.equalTo(54)
        }
        
        moreButton.snp.makeConstraints { make in
            make.leading.equalTo(homeButton.snp.trailing).offset(54)
            make.centerY.equalTo(homeButton)
            make.width.height.equalTo(54)
        }
    }
}
