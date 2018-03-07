//
//  GlobalConst.swift
//  MySwiftDemo
//
//  Created by apple on 18/2/27.
//  Copyright © 2018年 ImbaWales. All rights reserved.
//

import UIKit

// MARK: - 设备信息
/// 当前app版本号
let GetAppCurrentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
/// 获取设备系统号
let GetSystemVersion = UIDevice.current.systemVersion
/// iPhone设备
let isIPhone = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? true : false)
/// iPad设备
let isIPad = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? true : false)
/// iPhone4设备
let isIPhone4 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) < 568.0 ? true : false)
/// iPhone5设备
let isIPhone5 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 568.0 ? true : false)
/// iPhone6设备
let isIPhone6 = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 667.0 ? true : false)
/// iPhone6Plus设备
let isIPhone6P = (max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.height) == 736.0 ? true : false)


// MARK: - 尺寸
/// 屏幕高
let SCREEN_HEIGHT = UIScreen.main.bounds.height
/// 屏幕宽
let SCREEN_WIDTH = UIScreen.main.bounds.width
/// tabbar切换视图控制器高度
let kTabbarHeight = 49.0
/// 搜索视图高度
let kSearchBarHeight = 45.0
/// 状态栏高度
let kStatusBarHeight = 20.0
/// 导航栏高度
let kNavigationHeight = 44.0





