//
//  UIImageViewWithMask.swift
//  CatsMorohing
//
//  Created by User10 on 2018/6/26.
//  Copyright © 2018年 WilhelmIllust. All rights reserved.
//

import UIKit

@IBDesignable
class UIImageViewWithMask: UIImageView {
    var maskImageView = UIImageView()

    @IBInspectable
    var maskImage:UIImage? {
        didSet{
            maskImageView.contentMode = UIViewContentMode.scaleAspectFit
            maskImageView.image=maskImage
            maskImageView.frame=bounds
            mask = maskImageView
        }
    }
}
