//
//  PHomeViewController.swift
//  Placidity
//
//  Created by 龚梦洋 on 2023/7/28.
//

import Foundation
import UIKit
import CoreImage
import SnapKit
import AnimatedCollectionViewLayout

enum HomeType {
    case rain
    case wind
    case stream
    case wave
    case insect
    case ethereal
    
    var string: String {
        switch self {
        case .rain:
            return "rain"
        case .wind:
            return "wind"
        case .stream:
            return "stream"
        case .wave:
            return "wave"
        case .insect:
            return "insect"
        case .ethereal:
            return "ethereal"
        }
    }
}

class PHomeViewController: UIViewController {
    
    private var dataSource: [HomeType] = [.rain, .wind, .stream, .wave, .insect, .ethereal]
    private var currentIndex = 0
    
//    private lazy var privateButton: UIButton = {
//        let button = UIButton()
//        button.setBackgroundImage(UIImage(named: "yinsibaohu"), for: .normal)
//        button.addTarget(self, action: #selector(privacyEvent), for: .touchUpInside)
//        return button
//    }()
    
    private lazy var privateImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "yinsibaohu"))
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private lazy var bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "homeBg"))
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private lazy var selectThemeBgView: UIView = {
        let view = UIView()
        view.backgroundColor = kColor(r: 255, g: 255, b: 255, 0.3)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Don't tell me the result.\n\nJust know it in your mind"
        label.numberOfLines = 0
        return label
    }()

    private lazy var homeCollectionView: UICollectionView = {
        let layout = AnimatedCollectionViewLayout()
        layout.animator = LinearCardAttributesAnimator(itemSpacing: 0.28, scaleRate: 0.8)
        let width = pScreenWidth - 70 - 32
        let h = kNavigationBarHeight + 20 + 24 + 80 + kTabbarHeight + 32 + 50 + 32
        let height = pScreenHeight - h
        layout.itemSize = CGSize(width: width, height: height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        return collectionView
    }()
    
    private lazy var meditationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Start Meditating", for: .normal)
        button.setTitleColor(kColor(r: 56, g: 56, b: 56), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(meditationEvent), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        view.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
//        bgImageView.addSubview(privateButton)
//        privateButton.snp.makeConstraints { make in
//            make.left.equalTo(24)
//            make.top.equalTo(kTopSafeHeight + 35)
//            make.width.height.equalTo(24)
//        }
        
        let privateTap = UITapGestureRecognizer(target: self, action: #selector(privacyEvent))
        privateImageView.addGestureRecognizer(privateTap)
        
        view.addSubview(privateImageView)
        privateImageView.snp.makeConstraints { make in
            make.left.equalTo(24)
            make.top.equalTo(kTopSafeHeight + 40)
            make.width.height.equalTo(24)
        }
        
        view.bringSubviewToFront(privateImageView)
        
        view.addSubview(meditationButton)
        meditationButton.snp.makeConstraints { make in
            make.bottom.equalTo(-(kTabbarHeight + 32))
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        bgImageView.addSubview(selectThemeBgView)
        selectThemeBgView.snp.makeConstraints { make in
            make.width.equalTo(pScreenWidth - 70)
            make.centerX.equalToSuperview()
            make.top.equalTo(kNavigationBarHeight + 20)
            make.bottom.equalTo(meditationButton.snp.top).offset(-32)
        }
        
        selectThemeBgView.addSubview(helloLabel)
        helloLabel.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(80)
        }
        
        selectThemeBgView.addSubview(homeCollectionView)
        homeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(0)
        }
    }
    
    @objc func meditationEvent() {
        let vc = PMeditationViewController()
        vc.type = dataSource[currentIndex]
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(vc, animated: true)
    }
    
    @objc func privacyEvent() {
        let vc = PPrivacyViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell
        cell?.homeType = dataSource[indexPath.item]
        return cell ?? HomeCell()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let width = pScreenWidth - 70 - 32
        let index = Int(offsetX / width)
        currentIndex = index
    }
}

class HomeCell: UICollectionViewCell {
    
    private lazy var bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "wind"))
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
        contentView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    var homeType: HomeType? {
        didSet {
            if let homeType = homeType {
                bgImageView.image = UIImage(named: homeType.string)
            }
        }
    }
}
