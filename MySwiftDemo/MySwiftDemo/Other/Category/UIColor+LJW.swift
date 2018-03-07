//
//  UIColor+LJW.swift
//  MySwiftDemo
//
//  Created by apple on 18/3/6.
//  Copyright © 2018年 ImbaWales. All rights reserved.
//

import UIKit

// MARK: - 颜色
extension UIColor {

    
    /// 根据rgb生成颜色
    ///
    /// - Parameters:
    ///   - r: RED
    ///   - g: GREEN
    ///   - b: BLUE
    ///   - alpha: ALPHA
    /// - Returns: 颜色
    class func RGBCOLOR(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat) -> UIColor {
        return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: alpha)
    }
    
    
    /// 将由6个字符十六进制颜色转换到UIColor对象，会自动截取前面的 # 号
    ///
    /// - Parameter hex: 颜色字符串
    /// - Returns: 颜色
    class func colorWithHexString (_ hex: String) -> UIColor {
        var color = UIColor.red
        var cStr : String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if cStr.hasPrefix("#") {
            let index = cStr.index(after: cStr.startIndex)
            cStr = cStr.substring(from: index)
        }
        if cStr.characters.count != 6 {
            return UIColor.black
        }
        
        let rRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
        let rStr = cStr.substring(with: rRange)
        
        let gRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
        let gStr = cStr.substring(with: gRange)
        
        let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
        let bStr = cStr.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        
        color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
        
        return color
    }
    

    /// 生成随机颜色
    ///
    /// - Returns: 颜色
    class func randomColor() -> UIColor {
        let hue = ( CGFloat(arc4random()).truncatingRemainder(dividingBy: 256) / 256.0 ) // 0.0 to 1.0
        let saturation = ( CGFloat(arc4random()).truncatingRemainder(dividingBy: 128) / 256.0 ) + 0.5 // 0.5 to 1.0,away from white
        let brightness = ( CGFloat(arc4random()).truncatingRemainder(dividingBy: 128) / 256.0 ) + 0.5 // 0.5 to 1.0,away from black
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    
    /// 颜色生成图片
    /// 是对象方法
    /// - Returns: UIimage
    func trans2Image() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage ?? UIImage()
    }
}
