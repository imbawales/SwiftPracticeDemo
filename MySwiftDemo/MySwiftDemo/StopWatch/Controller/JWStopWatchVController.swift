//
//  JWStopWatchVController.swift
//  MySwiftDemo
//
//  Created by apple on 18/3/5.
//  Copyright © 2018年 ImbaWales. All rights reserved.
//

import UIKit

class JWStopWatchVController: UIViewController {
    
    weak var countLabel : UILabel!
    weak var playBtn: UIButton!
    weak var pauseBtn: UIButton!
    var timer: Timer!
    var isPlaying = false
    var count = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.addAllSubviews()
    }
    
    deinit {
        print("dealloc stop watch")
        timer.invalidate()
        timer = nil
        
    }


    func addAllSubviews() {
        // title
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
        titleLabel.text = "Stop Watch"
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = UIColor.darkGray
        self.navigationItem.titleView = titleLabel
        
        // content view
        let contentV = UIView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 64))
        contentV.backgroundColor = UIColor.colorWithHexString("4C4C4C")
        self.view.addSubview(contentV)
        
        // label
        let countLabel = UILabel(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: (SCREEN_HEIGHT-64)/2 - 50))
        countLabel.textColor = UIColor.white
        countLabel.backgroundColor = UIColor.clear
        countLabel.font = UIFont.systemFont(ofSize: 70, weight: 0.08)
        countLabel.textAlignment = NSTextAlignment.center
        countLabel.text = "0"
        self.view.addSubview(countLabel)
        self.countLabel = countLabel
        
        // play Btn
        let playBtn = UIButton(type: UIButtonType.custom)
        playBtn.frame = CGRect(x: 1, y: countLabel.frame.maxY + 1, width: (SCREEN_WIDTH-3)/2, height: SCREEN_HEIGHT-countLabel.frame.maxY - 2)
        playBtn.setImage(UIImage.init(named: "play"), for: .normal)
        playBtn.backgroundColor = UIColor.colorWithHexString("545DFC")
        playBtn.addTarget(self, action: #selector(playBtnClick(btn:)), for: .touchUpInside)
        self.view.addSubview(playBtn)
        self.playBtn = playBtn
        
        // pause Btn
        let pauseBtn = UIButton(type: UIButtonType.custom)
        pauseBtn.frame = CGRect(x: playBtn.frame.maxX + 1, y: countLabel.frame.maxY + 1, width: (SCREEN_WIDTH-3)/2, height: SCREEN_HEIGHT-countLabel.frame.maxY - 2)
        pauseBtn.backgroundColor = UIColor.colorWithHexString("66BE08")
        pauseBtn.setImage(UIImage.init(named: "pause"), for: .normal)
        pauseBtn.addTarget(self, action: #selector(pauseBtnClick(btn:)), for: .touchUpInside)
        self.view.addSubview(pauseBtn)
        self.pauseBtn = pauseBtn
        
        // reset btn
        let resetBtn = UIButton(type: UIButtonType.custom)
        resetBtn.frame = CGRect(x: SCREEN_WIDTH -  70, y: 75, width: 60, height: 25)
        resetBtn.backgroundColor = UIColor.clear
        resetBtn.setTitle("reset", for: .normal)
        resetBtn.setTitleColor(.white, for: .normal)
        resetBtn.addTarget(self, action: #selector(resetBtnClick(btn:)), for: .touchUpInside)
        self.view.addSubview(resetBtn)
    }
    
    
    func playBtnClick(btn: UIButton) {
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCount), userInfo: nil, repeats: true)
    }
    
    func pauseBtnClick(btn: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
    }

    func resetBtnClick(btn: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
        timer.invalidate()
        count = 0
        countLabel.text = "0"
    }

    func updateCount() {
        count = count + 0.1
        countLabel.text = String(format:"%.1f", count)
    }
}
