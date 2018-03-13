//
//  JWCustomFontViewController.swift
//  MySwiftDemo
//
//  Created by apple on 18/3/7.
//  Copyright © 2018年 ImbaWales. All rights reserved.
//

/**
 
 添加自定义字体步骤:
 1.把字体的.ttf或者.otf文件拉进项目
 2.在info.plist里面添加Fonts provided by application, 
   里面加上font的item, item的value为字体文件的全名(包括.ttf后缀, 如MFZhiHei_Noncommercial-Regular.ttf)
 
 */

import UIKit

class JWCustomFontViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 写let会报错, 写var不报错, 推测写let声明的属性必须要初始化
    weak var tableV: UITableView?
    
    let fontNameArr = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
    let dataArr = ["写紧swift demo", "今天是星期二!", "imbalance is nothing", "好无聊的「王者荣耀」", "我是一个cell", "😁哈哈哈哈哈呵呵呵", "微信wales__", "找工作啊找工作!", "这是什么鬼字体???"]
    
    var fontIndex = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.addChildViews()
    }


    func addChildViews() {
        // title
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
        titleLabel.text = "Custom Font"
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = UIColor.darkGray
        self.navigationItem.titleView = titleLabel
        
        // table view
        let tableV = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 150 - 64), style: .plain)
        tableV.backgroundColor = .black
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellID")
        tableV.tableFooterView = UIView()
        tableV.separatorStyle = .none
        self.view.addSubview(tableV)
        self.tableV = tableV
        
        // button
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: (SCREEN_WIDTH/2)-55, y: tableV.frame.maxY+20, width: 110, height: 110)
        btn.setTitle("Change Font", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "MFTongXin_Noncommercial-Regular", size: 14)
        btn.backgroundColor = .orange
        btn.layer.cornerRadius = 55
        btn.addTarget(self, action: #selector(changeFontBtnClick), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    func changeFontBtnClick() {
        fontIndex = (fontIndex + 1)%fontNameArr.count
        self.tableV?.reloadData()
        print("\(fontIndex)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableV?.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell?.textLabel?.text = dataArr[indexPath.row]
        cell?.textLabel?.textColor = .white
        cell?.textLabel?.backgroundColor = .black
        cell?.contentView.backgroundColor = .black
        cell?.textLabel?.font = UIFont(name: fontNameArr[fontIndex], size: 16)
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
}
