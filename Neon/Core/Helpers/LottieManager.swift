//
//  File.swift
//  
//
//  Created by Tuna Öztürk on 11.03.2023.
//

import Foundation
import UIKit
import Lottie

public class LottieManager{
    
    
    public static func createLottie(animation : AnimationType) -> LottieAnimationView {
        let defaultAnimationName = animation.rawValue.name
        let animLoading = LottieAnimationView(name: defaultAnimationName)
        animLoading.backgroundColor = .clear
        animLoading.loopMode = .loop
        animLoading.animationSpeed = 1
        animLoading.backgroundBehavior = .pauseAndRestore
        animLoading.play()
        return animLoading
    }

    
    
    public static func showFullScreenLottie(animation : AnimationType, width : Int? = nil, color : UIColor? = nil, backgroundOpacity : Double = 0.65) {
        
        guard let window = UIApplication.shared.keyWindow else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001, execute: {
                self.showFullScreenLottie(animation: animation, width: width, color: color, backgroundOpacity : backgroundOpacity)
            })
            return
        }
        
        let viewLoading = UIView()
        viewLoading.frame = window.bounds
        viewLoading.tag = 10000
        viewLoading.backgroundColor = .black.withAlphaComponent(backgroundOpacity)
        
        let defaultAnimationWidht = animation.rawValue.width
        let defaultAnimationName = animation.rawValue.name
        let animLoading = LottieAnimationView(name: defaultAnimationName)
        animLoading.frame.size = CGSize(width: width ?? defaultAnimationWidht, height: width ?? defaultAnimationWidht)
        animLoading.center = window.center
        animLoading.backgroundColor = .clear
        animLoading.loopMode = .loop
        animLoading.animationSpeed = 1
        animLoading.backgroundBehavior = .pauseAndRestore
        viewLoading.addSubview(animLoading)
        animLoading.play()
        
        
        if let color{
            let viewTint = UIView()
            viewTint.frame = window.bounds
            viewTint.backgroundColor = color
            viewLoading.addSubview(viewTint)
            viewTint.mask = animLoading
        }
        
        window.addSubview(viewLoading)

    }
    
    public static func removeFullScreenLottie(){
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        for subview in window.subviews{
            if subview.tag == 10000{
                subview.removeFromSuperview()
            }
        }
    }
    
    
    
     public enum AnimationType : RawRepresentable{
         case loadingCircle
         case loadingCircle2
         case loadingCircle3
         case loadingDots
         case loadingDots2
         case loadingDots3
         case loadingDots4
         case loadingDots5
         case loadingDots6
         case loadingShapes
         case loadingBar
         case loadingLines
         case loadingLines2
         case loadingPlane
         case loadingSpinner
         case downloading
         case downloading2
         case downloading3
         case custom(name : String)
         
        
        public typealias RawValue = (name: String, width: Int)
        
        public var rawValue: RawValue {
            switch self {
            case .custom(name: let name):
                return (name: name, width: 100)
            case .loadingCircle:
                return (name: "loadingCircle", width: 150)
            case .loadingCircle2:
                return (name: "loadingCircle2", width: 120)
            case .loadingDots:
                return (name: "loadingDots", width: 90)
            case .loadingDots2:
                return (name: "loadingDots2", width: 90)
            case .loadingPlane:
                return (name: "loadingPlane", width: 150)
            case .loadingSpinner:
                return (name: "loadingSpinner", width: 40)
            case .loadingCircle3:
                return (name: "loadingCircle3", width: 70)
            case .loadingDots4:
                return (name: "loadingDots4", width: 120)
            case .loadingDots5:
                return (name: "loadingDots5", width: 100)
            case .loadingDots6:
                return (name: "loadingDots6", width: 100)
            case .loadingDots3:
                return (name: "loadingDots3", width: 100)
            case .loadingShapes:
                return (name: "loadingShapes", width: 100)
            case .loadingBar:
                return (name: "loadingBar", width: 100)
            case .loadingLines:
                return (name: "loadingLines", width: 100)
            case .loadingLines2:
                return (name: "loadingLines2", width: 80)
            case .downloading:
                return (name: "downloading", width: 100)
            case .downloading2:
                return (name: "downloading2", width: 80)
            case .downloading3:
                return (name: "downloading3", width: 60)
                
            }
        }
        
        
        public init?(rawValue: RawValue) {
            switch rawValue {
            default:
                return nil
            }
        }
        
        
    }
    
    
}


