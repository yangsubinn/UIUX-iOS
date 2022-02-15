//
//  HomeVC.swift
//  NavigationBar-GenieMusic
//
//  Created by 양수빈 on 2022/02/14.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Properties
    
    private let headerView = HomeHeaderView()
    private let nameLabel = UILabel()
    private let chartButton = UIButton()
    private let detailButton = UIButton()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
    
    // MARK: - Method
    
    private func setUI() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
        nameLabel.text = "HomeVC👻"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 20)
        
        chartButton.setTitle("트렌디한 지니차트", for: .normal)
        chartButton.setTitleColor(.blue, for: .normal)
        
        detailButton.setTitle("앨범 상세", for: .normal)
        detailButton.setTitleColor(.blue, for: .normal)
    }
    
    private func setLayout() {
        view.addSubview(headerView)
        view.addSubview(nameLabel)
        view.addSubview(chartButton)
        view.addSubview(detailButton)
        
        headerView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        chartButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        detailButton.snp.makeConstraints { make in
            make.top.equalTo(chartButton.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        chartButton.addTarget(self, action: #selector(goToChartVC), for: .touchUpInside)
        detailButton.addTarget(self, action: #selector(goToDetailVC), for: .touchUpInside)
    }
    
    // MARK: - @objc
    @objc
    func goToChartVC() {
        guard let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChartVC") as? ChartVC else { return }
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    func goToDetailVC() {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
