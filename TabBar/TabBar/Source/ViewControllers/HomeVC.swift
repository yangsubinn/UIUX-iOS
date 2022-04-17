//
//  HomeVC.swift
//  TabBar
//
//  Created by 양수빈 on 2022/04/11.
//

import UIKit

class HomeVC: UIViewController {
    
    static let identifier = "HomeVC"
    
    // MARK: - Properties

    private let contentScrollView = UIScrollView()
    private let contentView = UIView()
    private let firstView = UIView()
    private let secondView = UIView()

    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
    }
    
    // MARK: - Custom Methods
    
    private func setUI() {
        contentScrollView.backgroundColor = .white
        contentView.backgroundColor = .clear
        firstView.backgroundColor = .orange
        secondView.backgroundColor = .blue
    }
    
    private func setDelegate() {
        contentScrollView.delegate = self
    }
    
    private func setLayout() {
        view.addSubview(contentScrollView)
        
        contentScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentScrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1400)
        }
        
        contentView.addSubview(firstView)
        contentView.addSubview(secondView)
        
        firstView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(600)
        }
        
        secondView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(800)
        }
    }
    
    func hideHeader() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            let parent = self.parent as! TabBar
            parent.hideHeader()
        })
    }
    
    func showHeader() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            let parent = self.parent as! TabBar
            parent.showHeader()
        })
    }
}

extension HomeVC: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        hideHeader()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        showHeader()
    }
}
