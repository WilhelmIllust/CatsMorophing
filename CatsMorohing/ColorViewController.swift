//
//  ColorViewController.swift
//  CatsMorohing
//
//  Created by User10 on 2018/6/26.
//  Copyright © 2018年 WilhelmIllust. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    internal var delegate:colorDelegate!
    var 毛色 = UIColor.white
    var 貓 = "TrollFace"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! rotateViewController
        controller.毛色=catBody.backgroundColor!
    }
    @IBAction func back(_ sender: Any) {
        self.delegate?.whenBack(catsBackground: catBody.backgroundColor!)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        貓圖.image = UIImage(named: 貓)
        catBody.backgroundColor=毛色
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveColor(_ sender: Any) {
        var red:CGFloat = 0.0
        var gre:CGFloat = 0.0
        var blu:CGFloat = 0.0
        var alp:CGFloat = 0.0
        catBody.backgroundColor!.getRed(&red, green: &gre, blue:
            &blu, alpha: &alp)
        let tmpColor:Color = Color(red:Float(red), green: Float(gre), blue:
            Float(blu))
        if let colorsFromFile=Color.readColorsFromFile(){
            var colors=[tmpColor]+colorsFromFile
            if (colors.count>15){
                print("colors are more than 15")
                colors.removeLast()
            }
            print("save colors")
            Color.saveColorsToFile(catsColor: colors)
        }else{
            
            print("save a color")
            Color.saveColorsToFile(catsColor: [tmpColor])
        }
    }
//    @IBOutlet weak var 我是貓提示按鈕: SYButton!
    @IBOutlet weak var 貓圖: UIImageView!
    @IBOutlet weak var catBody: UIImageViewWithMask!
    
    @IBAction func sliderOnchange(_ sender: Any) {
        catBody.backgroundColor=UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        self.delegate?.whenBack(catsBackground: catBody.backgroundColor!)
        var red:CGFloat = 0.0
        var gre:CGFloat = 0.0
        var blu:CGFloat = 0.0
        var alp:CGFloat = 0.0
        catBody.backgroundColor!.getRed(&red, green: &gre, blue:
            &blu, alpha: &alp)
        let tmpColor:Color = Color(red:Float(red), green: Float(gre), blue:
            Float(blu))
        Color.tmpSave(catsColor: tmpColor)

    }
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
}
