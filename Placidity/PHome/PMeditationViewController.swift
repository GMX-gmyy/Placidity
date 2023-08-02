//
//  PMeditationViewController.swift
//  Placidity
//
//  Created by 龚梦洋 on 2023/7/28.
//

import Foundation
import UIKit
import AVKit

class PMeditationViewController: UIViewController {
    
    var type: HomeType?
    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    private var timeObserval: Any?
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(meditationBack), for: .touchUpInside)
        return button
    }()
    
    private lazy var bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: type!.string))
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = kColor(r: 255, g: 255, b: 255, 0.30)
        return view
    }()
    
    private lazy var currentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var totalTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var progressBarView: UISlider = {
        let view = UISlider()
        view.minimumValue = 0
        view.maximumValue = 1.0
        view.thumbTintColor = .white
        view.minimumTrackTintColor = kColor(r: 95, g: 12, b: 240)
        view.maximumTrackTintColor = .white
        view.value = 0
        view.addTarget(self, action: #selector(sliderChanged(slider:)), for: .valueChanged)
        return view
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "start"), for: .normal)
        button.setImage(UIImage(named: "stop"), for: .selected)
        button.addTarget(self, action: #selector(startMeditation(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    deinit {
        if (player == nil) {
            return
        }
        removePlayerObserval()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupPlayer()
        NotificationCenter.default.addObserver(self, selector: #selector(enterBack), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    private func setupUI() {
        
        view.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bgImageView.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(kTopSafeHeight + 40)
            make.left.equalTo(24)
            make.width.height.equalTo(24)
        }
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(pScreenHeight / 4)
        }
        
        bottomView.addSubview(progressBarView)
        progressBarView.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.left.equalTo(24 + 60)
            make.right.equalTo(-24 - 60)
            make.height.equalTo(30)
        }
        
        bottomView.addSubview(currentTimeLabel)
        currentTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(24)
            make.right.equalTo(progressBarView.snp.left).offset(-8)
            make.centerY.equalTo(progressBarView.snp.centerY).offset(0)
        }
        
        bottomView.addSubview(totalTimeLabel)
        totalTimeLabel.snp.makeConstraints { make in
            make.right.equalTo(-24)
            make.left.equalTo(progressBarView.snp.right).offset(8)
            make.centerY.equalTo(progressBarView.snp.centerY).offset(0)
        }
        
        bottomView.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.top.equalTo(progressBarView.snp.bottom).offset(24)
            make.width.height.equalTo(36)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupPlayer() {
        let fileURL = URL(fileURLWithPath: Bundle.main.path(forResource: type!.string, ofType: "mp3")!)
        playerItem = AVPlayerItem(url: fileURL)
        player = AVPlayer(playerItem: playerItem)
        //获取音乐时长
        let audioAsset = AVURLAsset(url: fileURL, options: nil)
        let duration = audioAsset.duration
        let durationInSeconds = CMTimeGetSeconds(duration)
        totalTimeLabel.text = String(format: "%02d:%02d", Int(durationInSeconds) / 60, Int(durationInSeconds) % 60)
        
        timeObserval = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.01, preferredTimescale: 600), queue: DispatchQueue.main, using: { [weak self] cmTime in
            let current = CMTimeGetSeconds(cmTime)
            let total = CMTimeGetSeconds((self?.playerItem!.duration)!)
            let progress = Float(current) / Float(total)
            let time = String(format: "%02d:%02d", Int(current) / 60,Int(current) % 60)
            self?.progressBarView.value = progress
            self?.currentTimeLabel.text = time
            if (progress >= 0.999) {
                self?.player?.seek(to: CMTime.zero)
                self?.startButton.isSelected = false
                self?.progressBarView.value = 0
                self?.currentTimeLabel.text = "00:00"
            }
        })
    }
    
    private func play() {
        if (player == nil) {
            return
        }
        player?.play()
    }
    
    private func pause() {
        if (player == nil) {
            return
        }
        player?.pause()
    }
    
    private func removePlayerObserval() {
        if (player == nil || timeObserval == nil) {
            return
        }
        player?.removeTimeObserver(self.timeObserval as Any)
        timeObserval = nil
    }
    
    @objc func enterBack() {
        self.startButton.isSelected = false
        pause()
    }
    
    @objc func startMeditation(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if (sender.isSelected) {
            play()
        } else {
            pause()
        }
    }
    
    @objc func meditationBack() {
        self.dismiss(animated: true)
    }
    
    @objc func sliderChanged(slider: UISlider) {
        // 视频的总时间
        let sumTime = Float((player?.currentItem?.duration.value)!) / Float((player?.currentItem?.duration.timescale)!)
        // 视频要切换的时间
        let toTime = sumTime * slider.value
        // 切换时间
        player?.seek(to: CMTimeMakeWithSeconds(Float64(toTime), preferredTimescale: Int32((player?.currentItem?.duration.timescale)!)), completionHandler: { [weak self] (Bool) in
            self?.play()
        })
    }
}
