//
//  PBaseNavigationView.swift
//  Placidity
//
//  Created by 龚梦洋 on 2023/7/28.
//

import Foundation
import UIKit

class PBaseNavigationView: UIView {
    
    var backBlock: (() -> ())?
    var rightBlock: (() -> ())?
    
    public lazy var barView: UIView = {
        let view = UIView()
        return view
    }()
    
    public lazy var naviBack: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backEvent), for: .touchUpInside)
        return button
    }()
    
    public lazy var naviRight: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(rightEvent), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(barView)
        barView.snp.makeConstraints { make in
            make.top.equalTo(kTopSafeHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
        barView.addSubview(naviBack)
        naviBack.snp.makeConstraints { make in
            make.left.equalTo(24)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        barView.addSubview(naviRight)
        naviRight.snp.makeConstraints { make in
            make.right.equalTo(-24)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
    
    @objc func backEvent() {
        backBlock?()
    }
    
    @objc func rightEvent() {
        rightBlock?()
    }
}

