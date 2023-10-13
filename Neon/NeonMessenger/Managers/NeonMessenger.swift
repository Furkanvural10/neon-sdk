//
//  NeonMessenger.swift
//  NeonSDKChatModule
//
//  Created by Tuna Öztürk on 14.09.2023.
//

import Foundation
import UIKit

open class NeonMessenger{
    
    
    open static func addConnection(id: String, firstName : String, lastName : String, photoURL : String){
        let newUser = NeonMessengerUser(id : id, firstName: firstName, lastName: lastName, photoURL: photoURL)
        NeonMessengerManager.arrConnections.append(newUser)
    }
    
    open static func setCurrentUser(id: String, firstName : String, lastName : String, photoURL : String){
        let currentUser = NeonMessengerUser(id : id, firstName: firstName, lastName: lastName, photoURL: photoURL)
        NeonMessengerManager.currentUser = currentUser
        
        NeonMessengerConstants.didCurrentUserConfigured = true
        
    }
    
    open static func customizeColors(
        primaryBackgroundColor : UIColor,
        secondaryBackgroundColor : UIColor,
        primaryTextColor : UIColor,
        secondaryTextColor : UIColor,
        searchfieldBorderColor : UIColor,
        searchfieldBackgroundColor : UIColor,
        sendButtonColor : UIColor,
        backButtonColor : UIColor,
        searchIconColor : UIColor,
        inputFieldBackgroundColor : UIColor,
        inputFieldBorderColor : UIColor,
        inputFieldTextColor : UIColor,
        connectionMessageBackgroundColor : UIColor,
        currentUserMessageBackgroundColor : UIColor){
            
            
            NeonMessengerConstants.primaryBackgroundColor = primaryBackgroundColor
            NeonMessengerConstants.secondaryBackgroundColor = secondaryBackgroundColor
            NeonMessengerConstants.primaryTextColor = primaryTextColor
            NeonMessengerConstants.secondaryTextColor = secondaryTextColor
            NeonMessengerConstants.searchfieldBorderColor = searchfieldBorderColor
            NeonMessengerConstants.searchfieldBackgroundColor = searchfieldBackgroundColor
            NeonMessengerConstants.sendButtonColor = sendButtonColor
            NeonMessengerConstants.backButtonColor = backButtonColor
            NeonMessengerConstants.searchIconColor = searchIconColor
            NeonMessengerConstants.inputFieldBackgroundColor = inputFieldBackgroundColor
            NeonMessengerConstants.inputFieldBorderColor = inputFieldBorderColor
            NeonMessengerConstants.inputFieldTextColor = inputFieldTextColor
            NeonMessengerConstants.connectionMessageBackgroundColor = connectionMessageBackgroundColor
            NeonMessengerConstants.currentUserMessageBackgroundColor = currentUserMessageBackgroundColor
            
            NeonMessengerConstants.didColorsConfigured = true
            
        }
    
    
    open static func customizeContent(messengerTitle : String,
                                 searchfieldPlaceholder : String,
                                 inputFieldPlaceholder : String){
        NeonMessengerConstants.messengerTitle = messengerTitle
        NeonMessengerConstants.searchfieldPlaceholder = searchfieldPlaceholder
        NeonMessengerConstants.inputFieldPlaceholder = inputFieldPlaceholder
        
        NeonMessengerConstants.didContentsConfigured = true

    }
    
    
}
