//
//  Color.swift
//  CatsMorohing
//
//  Created by User10 on 2018/6/26.
//  Copyright © 2018年 WilhelmIllust. All rights reserved.
//
import Foundation
import UIKit

struct Color: Codable {
    var red: Float
    var green: Float
    var blue: Float
    
    static func readColorsFromFile() -> [Color]? {
        let propertyDecoder = PropertyListDecoder()
        if let data = UserDefaults.standard.data(forKey: "catsColor"),
            let catsColor = try? propertyDecoder.decode([Color].self, from: data) {
            return catsColor
        } else {
            return nil
        }
    }
    
   
     static func saveColorsToFile(catsColor: [Color]) {
        
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(catsColor) {
            UserDefaults.standard.set(data, forKey: "catsColor")
        }
    }
    static func readTmpColorFromFile() -> Color? {
        let propertyDecoder = PropertyListDecoder()
        if let data = UserDefaults.standard.data(forKey: "tmpColor"),
            let color = try? propertyDecoder.decode(Color.self, from: data) {
            return color
        } else {
            return nil
        }
    }
   
    static func tmpSave(catsColor: Color) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(catsColor) {
            UserDefaults.standard.set(data, forKey: "tmpColor")
        }
    }
}
