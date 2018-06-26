//
//  rotateViewController.swift
//  CatsMorohing
//
//  Created by User10 on 2018/6/26.
//  Copyright © 2018年 WilhelmIllust. All rights reserved.
//

import UIKit

class rotateViewController: UIViewController {
    var 毛色 = UIColor.white
    var 貓 = "TrollFace"
    let animation:CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "transform.rotation.z")
    func Animation()  {
        animation.keyTimes=[0,1]
        animation.values=[0,CGFloat.pi*2]
        animation.isRemovedOnCompletion=false
        animation.repeatCount=MAXFLOAT
        animation.duration = 3
        tailView.layer.add(animation, forKey: "animation")
        /*引用自：
         作者：Karl0n
         链接：https://www.jianshu.com/p/2d2e333b2639
         來源：简书
         */
    }
    

    
    @IBOutlet weak var 身體毛色: UIImageViewWithMask!
    @IBOutlet weak var 尾巴毛色: UIImageViewWithMask!
    override func viewDidLoad() {
        super.viewDidLoad()
        身體毛色.backgroundColor=毛色
        尾巴毛色.backgroundColor=毛色
        Animation()
        // Do any additional setup after loading the view.
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var tailView: UIView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
