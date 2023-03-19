//
//  File.swift
//  
//
//  Created by Tuna Öztürk on 19.03.2023.
//

import Foundation


class NeonFont{
    
    internal init(fileName : String, fileExtension : String, postScriptName : String ) {
        self.fileName = fileName
        self.fileExtension = fileExtension
        self.postScriptName = postScriptName
    }
    
   
    var fileName = ""
    var postScriptName = ""
    var fileExtension = ""
}

let arrFonts = [
    NeonFont(fileName: "SF-Pro-Display-Regular", fileExtension: "otf", postScriptName: "SFProDisplay-Regular"),
    NeonFont(fileName: "SF-Pro-Display-Medium", fileExtension: "otf", postScriptName: "SFProDisplay-Medium"),
    NeonFont(fileName: "SF-Pro-Display-Semibold", fileExtension: "otf", postScriptName: "SFProDisplay-Semibold"),
    NeonFont(fileName: "SF-Pro-Display-Bold", fileExtension: "otf", postScriptName: "SFProDisplay-Bold"),
    
    NeonFont(fileName: "SF-Pro-Text-Regular", fileExtension: "otf", postScriptName: "SFProText-Regular"),
    NeonFont(fileName: "SF-Pro-Text-Medium", fileExtension: "otf", postScriptName: "SFProText-Medium"),
    NeonFont(fileName: "SF-Pro-Text-Semibold", fileExtension: "otf", postScriptName: "SFProText-Semibold"),
    NeonFont(fileName: "SF-Pro-Text-Bold", fileExtension: "otf", postScriptName: "SFProText-Bold"),
    
    NeonFont(fileName: "Inter-Regular", fileExtension: "ttf", postScriptName: "Inter-Regular"),
    NeonFont(fileName: "Inter-Medium", fileExtension: "ttf", postScriptName: "Inter-Medium"),
    NeonFont(fileName: "Inter-SemiBold", fileExtension: "ttf", postScriptName: "Inter-SemiBold"),
    NeonFont(fileName: "Inter-Bold", fileExtension: "ttf", postScriptName: "Inter-Bold"),
    
    NeonFont(fileName: "Poppins-Regular", fileExtension: "ttf", postScriptName: "Poppins-Regular"),
    NeonFont(fileName: "Poppins-Medium", fileExtension: "ttf", postScriptName: "Poppins-Medium"),
    NeonFont(fileName: "Poppins-SemiBold", fileExtension: "ttf", postScriptName: "Poppins-SemiBold"),
    NeonFont(fileName: "Poppins-Bold", fileExtension: "ttf", postScriptName: "Poppins-Bold"),
   
    
]
/*
public extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 60
        case .title: return 48
        case .title2: return 34
        case .title3: return 24
        case .headline, .body: return 18
        case .subheadline, .callout: return 16
        case .footnote: return 14
        case .caption, .caption2: return 12
        @unknown default:
            return 8
        }
    }
}

*/
