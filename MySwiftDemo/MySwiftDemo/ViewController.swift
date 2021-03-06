//
//  ViewController.swift
//  MySwiftDemo
//
//  Created by apple on 18/2/27.
//  Copyright © 2018年 ImbaWales. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    weak var tableV: UITableView?
    
    lazy var demoArr = ["Stop Watch", "Custom Font"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jw_setupNavigationTitle()
        self.jw_addTableView()
    }
    
    func jw_setupNavigationTitle() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
        titleLabel.text = "🕷不会Swift"
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.darkGray
        self.navigationItem.titleView = titleLabel
    }
    
    func jw_addTableView() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "JWMainTableViewCell", bundle: nil), forCellReuseIdentifier: "cellID")
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        self.tableV = tableView
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! JWMainTableViewCell
        cell.titleL.text = self.demoArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let backBarBtn = UIBarButtonItem()
        backBarBtn.title = ""
        self.navigationItem.backBarButtonItem = backBarBtn
        
        let cell = tableView.cellForRow(at: indexPath) as! JWMainTableViewCell
        if  cell.titleL.text == "Stop Watch"{
            let vc = JWStopWatchVController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if  cell.titleL.text == "Custom Font"{
            let vc = JWCustomFontViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

