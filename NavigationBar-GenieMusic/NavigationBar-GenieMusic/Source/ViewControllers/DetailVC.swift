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
    private let collectionViewFlowLayout = UICollectionViewFlowLayout() //CustomCollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    
    // TODO: - 스크롤시 타이틀 생기도록
    lazy var navigationBar = NavigationBar(self, title: "")
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setAddTarget()
        setCollectionView()
    }
    
    // MARK: - Method
    
    private func setUI() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        view.backgroundColor = .white
        nameLabel.text = "DetailVC🥩"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 20)
        
        beforeButton.setTitle("이전 뷰로", for: .normal)
        beforeButton.setTitleColor(.red, for: .normal)
        
        nameLabel.isHidden = true
        beforeButton.isHidden = true
    }
    
    private func setLayout() {
        view.addSubview(collectionView)
        view.addSubview(navigationBar)
        view.addSubview(nameLabel)
        view.addSubview(beforeButton)
        
        navigationBar.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
//            make.top.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        beforeButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCVC.self, forCellWithReuseIdentifier: CustomCVC.identifier)
        collectionView.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeaderView.identifier)
//        collectionView.contentInset.top = -UIApplication.shared.statusBarFrame.height
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

extension DetailVC: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView.contentOffset.y >= 100 {
            navigationBar.setNaviTitle("앨범이다")
            navigationBar.backgroundColor = .orange
//            collectionViewFlowLayout.headerReferenceSize.height = 140
        } else {
            navigationBar.setNaviTitle("")
            navigationBar.backgroundColor = .clear
        }
    }
}

extension DetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-40, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width-40, height: 240)
    }
}

extension DetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCVC.identifier, for: indexPath) as? CustomCVC else { return UICollectionViewCell() }
        cell.titleLabel.text = "이게 뭐임?"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeaderView.identifier, for: indexPath) as? CustomHeaderView else { return UICollectionReusableView() }
        return headerView
    }
}
