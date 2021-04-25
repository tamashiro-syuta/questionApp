//
//  ChangeColor.swift
//  QuestionApp1
//
//  Created by 玉城秀大 on 2021/04/25.
//

import Foundation
import UIKit

class ChangeColor {
    
    func changeColor(topR:CGFloat,topG:CGFloat,topB:CGFloat,topAlpha:CGFloat,
                     bottomR:CGFloat,bottomG:CGFloat,bottomB:CGFloat,bottomAlpha:CGFloat) -> CAGradientLayer {
        
        //グラデーションの開始色
        let topColor = UIColor(red: topR, green: topG, blue: topB, alpha: topAlpha)
        let bottomColor = UIColor(red: bottomR, green: bottomG, blue: bottomB, alpha: bottomAlpha)
     
        //グラデーションの色を配列で管理
        let gradientColor = [topColor.cgColor,bottomColor.cgColor]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        
        return gradientLayer
        
    }
    
}
