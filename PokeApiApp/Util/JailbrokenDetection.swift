//
//  JailbrokenDetection.swift
//  PokeApiApp
//
//  Created by Jordan on 19/12/23.
//

import UIKit

class JailbrokenManager {
    
    static let shared = JailbrokenManager()
    
    func isJailbroken() -> Bool {
        let fileManager = FileManager.default
        
        let pathsToCheck = ["/Applications/Cydia.app", "/Library/MobileSubstrate/MobileSubstrate.dylib", "/bin/bash", "/usr/sbin/sshd", "/etc/apt"]
        
        for path in pathsToCheck {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        
        return false
    }
    
}


