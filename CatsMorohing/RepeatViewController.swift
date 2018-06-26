//
//  EnterViewController.swift
//  CatsMorohing
//
//  Created by User10 on 2018/6/26.
//  Copyright © 2018年 WilhelmIllust. All rights reserved.
//

import UIKit
import GameplayKit
import SYBlinkAnimationKit
import AVFoundation

class RepeatViewController: UIViewController,colorDelegate {
    
    var 毛色 = UIColor.white
    internal var delegate:colorDelegate!
    func whenBack(catsBackground:UIColor){
       // print("color should have been changed")
        catBody.backgroundColor=catsBackground
        self.delegate?.whenBack(catsBackground:catBody.backgroundColor!)
    }
    @IBOutlet weak var catBody: UIImageViewWithMask!
    var 貓 = "TrollFace"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ColorViewController
        controller.貓=貓
        controller.delegate=self
        controller.毛色=catBody.backgroundColor!
    }
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        貓圖.image = UIImage(named: 貓)
        我是貓提示按鈕.animationType = .background
        我是貓提示按鈕.animationBorderColor = UIColor.orange
        我是貓提示按鈕.animationTimingFunction = SYMediaTimingFunction.easeInEaseOut
        我是貓提示按鈕.startAnimating()
        nextButton.isEnabled=false
       catBody.backgroundColor=毛色
        //貓圖.layer.borderColor
    }
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBAction func 再說一遍我是貓(_ sender: Any) {
        nextButton.isEnabled=true
        let random = GKRandomDistribution(lowestValue: 0, highestValue: 4)
        let number = random.nextInt()
        switch number {
        case 0:
            let speechUtterance =  AVSpeechUtterance(string: "Repeat after me, I am a cat.")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        case 1:
            let speechUtterance =  AVSpeechUtterance(string: "跟我唸一遍，我是貓")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        case 2:
            let speechUtterance =  AVSpeechUtterance(string: "跟着我念一遍，我是猫")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-HK")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        case 3:
            let speechUtterance =  AVSpeechUtterance(string: "喵")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-HK")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        case 4:
            let speechUtterance =  AVSpeechUtterance(string: "Meow.")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        case 5:
            let speechUtterance =  AVSpeechUtterance(string: "I am ironman.")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        default:
            let speechUtterance =  AVSpeechUtterance(string: "拘拘")
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
            let synth = AVSpeechSynthesizer()
            synth.speak(speechUtterance)
        }
    }
    @IBOutlet weak var 我是貓提示按鈕: SYButton!
    @IBOutlet weak var 貓圖: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
